import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:pgd_physics/services/storage_service.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Gentle study reminders — opt-in only.
/// Uses a small distinct status icon where the platform allows.
class NotificationService {
  static final _plugin = FlutterLocalNotificationsPlugin();
  static bool _ready = false;

  static Future<void> init() async {
    if (_ready) return;
    tz.initializeTimeZones();

    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const ios = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );

    await _plugin.initialize(
      const InitializationSettings(android: android, iOS: ios),
    );
    _ready = true;
  }

  static Future<bool> requestPermission() async {
    final android = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    final granted = await android?.requestNotificationsPermission();
    return granted ?? false;
  }

  static Future<void> setEnabled(bool enabled) async {
    await StorageService.setNotificationsEnabled(enabled);
    if (!enabled) {
      await _plugin.cancelAll();
      return;
    }
    await init();
    final ok = await requestPermission();
    if (!ok) {
      await StorageService.setNotificationsEnabled(false);
      return;
    }
    await scheduleDailyStudyReminder();
  }

  /// Soft evening nudge — not spammy.
  static Future<void> scheduleDailyStudyReminder() async {
    if (!StorageService.notificationsEnabled()) return;
    await init();

    const androidDetails = AndroidNotificationDetails(
      'study_reminders',
      'Study reminders',
      channelDescription: 'Gentle nudges to continue learning',
      importance: Importance.defaultImportance,
      priority: Priority.defaultPriority,
      icon: '@mipmap/ic_launcher',
      // On Android, a small monochrome status icon can be set via icon;
      // full custom art needs drawable resources in the Android project.
      styleInformation: BigTextStyleInformation(
        'A short session is enough. Open PGD Physics when you are ready — Nova is here.',
        contentTitle: '${StorageService.getNickname()}, ready for a little study?',
      ),
    );

    const details = NotificationDetails(android: androidDetails);

    // 7:00 PM local — once per day
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      19,
      0,
    );
    if (scheduled.isBefore(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }

    try {
      await _plugin.zonedSchedule(
        1001,
        '${StorageService.getNickname()}, ready for a little study?',
        'Continue a lesson or say hi to Nova — no pressure.',
        scheduled,
        details,
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
    } catch (e) {
      debugPrint('Schedule reminder failed: $e');
    }
  }

  static Future<void> cancelAll() => _plugin.cancelAll();
}
