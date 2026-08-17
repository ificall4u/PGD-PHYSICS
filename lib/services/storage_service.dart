import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Local-first storage.
/// SharedPreferences: small flags & lists
/// Hive: larger structured data (chat history)
class StorageService {
  static late Box _box;
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _box = await Hive.openBox('pgd_physics');
    _prefs = await SharedPreferences.getInstance();
  }


  // ── User profile (onboarding) ────────────────────────────────
  static bool hasCompletedOnboarding() =>
      (_prefs.getString('user_nickname') ?? '').isNotEmpty;

  static String getNickname() =>
      _prefs.getString('user_nickname') ?? 'Friend';

  static Future<void> setNickname(String name) async {
    await _prefs.setString('user_nickname', name.trim());
  }

  static String getUserGender() =>
      _prefs.getString('user_gender') ?? 'unspecified';

  static Future<void> setUserGender(String g) async {
    await _prefs.setString('user_gender', g);
  }

  /// Preferred AI assistant gender: female | male | neutral
  static String getAiGender() =>
      _prefs.getString('ai_gender') ?? 'female';

  static Future<void> setAiGender(String g) async {
    await _prefs.setString('ai_gender', g);
  }

  /// Personality id — see PersonaCatalog
  static String getAiPersonalityId() {
    final id = _prefs.getString('ai_personality') ?? 'patient_professor';
    // If a locked persona is selected but not unlocked, fall back
    // (PersonaCatalog check deferred to callers that import it; soft guard here)
    return id;
  }

  static Future<void> setAiPersonalityId(String id) async {
    await _prefs.setString('ai_personality', id);
  }

  // ── Persona unlocks ──────────────────────────────────────────
  static List<String> unlockedPersonaIds() {
    return _prefs.getStringList('unlocked_personas') ?? [];
  }

  static bool isPersonaUnlocked(String id) {
    // Unlocked permanently once code accepted, or never locked
    return unlockedPersonaIds().contains(id);
  }

  static Future<void> unlockPersona(String id) async {
    final list = unlockedPersonaIds();
    if (!list.contains(id)) {
      list.add(id);
      await _prefs.setStringList('unlocked_personas', list);
    }
  }


  static Future<void> saveOnboarding({
    required String nickname,
    required String userGender,
    required String aiGender,
    required String personalityId,
  }) async {
    await setNickname(nickname);
    await setUserGender(userGender);
    await setAiGender(aiGender);
    await setAiPersonalityId(personalityId);
  }

  // ── AI settings (BYOK multi-provider) ─────────────────────────
  /// Legacy single key (migrated to Gemini on read)
  static Future<void> saveApiKey(String key) async {
    await saveProviderKey('gemini', key);
  }

  static String? getApiKey() => getProviderKey('gemini');

  static Future<void> saveProviderKey(String providerId, String key) async {
    final k = key.trim();
    final storageKey = 'api_key_$providerId';
    if (k.isEmpty) {
      await _prefs.remove(storageKey);
      if (providerId == 'gemini') await _prefs.remove('gemini_api_key');
    } else {
      await _prefs.setString(storageKey, k);
      if (providerId == 'gemini') {
        await _prefs.setString('gemini_api_key', k); // legacy compat
      }
    }
  }

  static String? getProviderKey(String providerId) {
    final v = _prefs.getString('api_key_$providerId');
    if (v != null && v.isNotEmpty) return v;
    // Migrate old single Gemini key
    if (providerId == 'gemini') {
      final legacy = _prefs.getString('gemini_api_key');
      if (legacy != null && legacy.isNotEmpty) return legacy;
    }
    return null;
  }

  static bool hasAnyProviderKey() {
    for (final id in ['gemini', 'groq', 'openrouter', 'cerebras']) {
      final k = getProviderKey(id);
      if (k != null && k.isNotEmpty) return true;
    }
    return false;
  }

  /// Preferred provider id: gemini | groq | openrouter | cerebras | auto
  static String getPreferredProvider() =>
      _prefs.getString('preferred_ai_provider') ?? 'auto';

  static Future<void> setPreferredProvider(String id) async {
    await _prefs.setString('preferred_ai_provider', id);
  }

  static Future<void> savePreferredModel(String model) async {
    await _prefs.setString('preferred_ai_model', model);
  }

  static String getPreferredModel() =>
      _prefs.getString('preferred_ai_model') ?? 'gemini';

  // ── Academic program (PGD / future MSc / PhD)
  static String getSelectedProgramId() =>
      _prefs.getString('selected_program_id') ?? 'pgd_physics_abuad';

  static Future<void> setSelectedProgramId(String id) async {
    await _prefs.setString('selected_program_id', id);
  }

  // ── Theme: system | light | dark ─────────────────────────────
  static String getThemeMode() =>
      _prefs.getString('theme_mode') ?? 'system';

  static Future<void> setThemeMode(String mode) async {
    await _prefs.setString('theme_mode', mode);
  }

  // ── Streak ───────────────────────────────────────────────────
  static int getStreak() => _prefs.getInt('study_streak') ?? 0;

  static Future<void> updateStreak() async {
    final last = _prefs.getString('last_study_date');
    final today = DateTime.now().toIso8601String().substring(0, 10);
    if (last == today) return;

    final yesterday = DateTime.now()
        .subtract(const Duration(days: 1))
        .toIso8601String()
        .substring(0, 10);

    int streak = _prefs.getInt('study_streak') ?? 0;
    streak = (last == yesterday) ? streak + 1 : 1;
    await _prefs.setInt('study_streak', streak);
    await _prefs.setString('last_study_date', today);
  }

  // ── Unit progress ────────────────────────────────────────────
  static Future<void> markUnitComplete(String unitId) async {
    final list = _prefs.getStringList('completed_units') ?? [];
    if (!list.contains(unitId)) {
      list.add(unitId);
      await _prefs.setStringList('completed_units', list);
    }
    await updateStreak();
  }

  static bool isUnitComplete(String unitId) {
    final list = _prefs.getStringList('completed_units') ?? [];
    return list.contains(unitId);
  }

  static int completedUnitCount() =>
      (_prefs.getStringList('completed_units') ?? []).length;

  static List<String> completedUnitIds() =>
      List<String>.from(_prefs.getStringList('completed_units') ?? []);

  // ── Last lesson (Continue) ───────────────────────────────────
  static Future<void> setLastLesson({
    required String courseId,
    required String topicId,
    required String unitId,
    required String courseTitle,
    required String topicTitle,
    required String unitTitle,
  }) async {
    await _prefs.setString('last_course_id', courseId);
    await _prefs.setString('last_topic_id', topicId);
    await _prefs.setString('last_unit_id', unitId);
    await _prefs.setString('last_course_title', courseTitle);
    await _prefs.setString('last_topic_title', topicTitle);
    await _prefs.setString('last_unit_title', unitTitle);
  }

  static Map<String, String>? getLastLesson() {
    final unitId = _prefs.getString('last_unit_id');
    if (unitId == null || unitId.isEmpty) return null;
    return {
      'courseId': _prefs.getString('last_course_id') ?? '',
      'topicId': _prefs.getString('last_topic_id') ?? '',
      'unitId': unitId,
      'courseTitle': _prefs.getString('last_course_title') ?? '',
      'topicTitle': _prefs.getString('last_topic_title') ?? '',
      'unitTitle': _prefs.getString('last_unit_title') ?? '',
    };
  }

  // ── Notifications ────────────────────────────────────────────
  static bool notificationsEnabled() =>
      _prefs.getBool('notifications_enabled') ?? false;

  static Future<void> setNotificationsEnabled(bool v) async {
    await _prefs.setBool('notifications_enabled', v);
  }

  // ── Nova chat history (offline re-read) ──────────────────────
  static String _safeThreadKey(String threadKey) {
    final cleaned = threadKey.replaceAll(RegExp(r'[^a-zA-Z0-9_|.-]'), '_');
    if (cleaned.isEmpty) return 'home';
    return cleaned.length > 120 ? cleaned.substring(0, 120) : cleaned;
  }

  /// Saves a thread keyed by context (e.g. unit id or "home").
  static Future<void> saveChatThread(
    String threadKey,
    List<Map<String, String>> messages,
  ) async {
    final key = 'chat_${_safeThreadKey(threadKey)}';
    final trimmed = messages.length > 40
        ? messages.sublist(messages.length - 40)
        : messages;
    try {
      await _box.put(key, jsonEncode(trimmed));
    } catch (_) {
      // Storage full or codec issue — fail soft; learning still works offline
    }
  }

  static List<Map<String, String>> loadChatThread(String threadKey) {
    final raw = _box.get('chat_${_safeThreadKey(threadKey)}');
    if (raw is! String || raw.isEmpty) return [];
    try {
      final list = jsonDecode(raw) as List<dynamic>;
      return list
          .map((e) => Map<String, String>.from(
                (e as Map).map((k, v) => MapEntry(k.toString(), v.toString())),
              ))
          .toList();
    } catch (_) {
      return [];
    }
  }

  static Future<void> clearChatThread(String threadKey) async {
    try {
      await _box.delete('chat_${_safeThreadKey(threadKey)}');
    } catch (_) {}
  }

  // ── Generic Hive ─────────────────────────────────────────────
  static Future<void> put(String key, dynamic value) async {
    await _box.put(key, value);
  }

  static T? get<T>(String key) => _box.get(key) as T?;

  static Future<void> clearAll() async {
    await _box.clear();
    await _prefs.clear();
  }
}
