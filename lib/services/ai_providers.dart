/// Client-side BYOK providers — no backend.
enum AiProviderId {
  gemini,
  groq,
  openrouter,
  cerebras,
}

class AiProviderInfo {
  final AiProviderId id;
  final String displayName;
  final String poweredByLabel;
  final String keyStorageKey;
  final String defaultModel;
  final String docsUrl;
  final List<String> howToSteps;

  const AiProviderInfo({
    required this.id,
    required this.displayName,
    required this.poweredByLabel,
    required this.keyStorageKey,
    required this.defaultModel,
    required this.docsUrl,
    required this.howToSteps,
  });
}

class AiProviders {
  static const List<AiProviderInfo> all = [
    AiProviderInfo(
      id: AiProviderId.gemini,
      displayName: 'Google Gemini',
      poweredByLabel: 'Powered by Gemini',
      keyStorageKey: 'api_key_gemini',
      defaultModel: 'gemini-2.0-flash',
      docsUrl: 'https://aistudio.google.com/apikey',
      howToSteps: [
        'Open aistudio.google.com in your phone browser and sign in with any Google (Gmail) account.',
        'If asked, accept the terms. You do not need to pay or add a credit card for the free tier.',
        'On the left side (or menu), tap Get API key / API keys.',
        'Tap Create API key. If it asks for a project, choose the default one or Create API key in new project.',
        'When the key appears, tap Copy. Paste it into the box above in this app, then tap Save AI keys.',
        'Tip: treat the key like a password. Do not share it or post it online.',
      ],
    ),
    AiProviderInfo(
      id: AiProviderId.groq,
      displayName: 'Groq',
      poweredByLabel: 'Powered by Groq',
      keyStorageKey: 'api_key_groq',
      defaultModel: 'llama-3.3-70b-versatile',
      docsUrl: 'https://console.groq.com/keys',
      howToSteps: [
        'Open console.groq.com in your browser (or groq.com → Start Building).',
        'Sign up or log in with email or Google. A credit card is not required for the free tier.',
        'Open API Keys (top menu or sidebar).',
        'Tap Create API Key, give it a simple name (e.g. “PGD Physics”), then submit.',
        'Copy the key immediately (it is often shown only once) and paste it into the box above.',
        'Tap Save AI keys in this app. Keep the key private.',
      ],
    ),
    AiProviderInfo(
      id: AiProviderId.openrouter,
      displayName: 'OpenRouter',
      poweredByLabel: 'Powered by OpenRouter',
      keyStorageKey: 'api_key_openrouter',
      defaultModel: 'openrouter/free',
      docsUrl: 'https://openrouter.ai/keys',
      howToSteps: [
        'Open openrouter.ai and tap Sign up (email, Google, or GitHub is fine).',
        'After you are signed in, go to openrouter.ai/keys (or Keys in the dashboard).',
        'Tap Create (or Create API key). You can leave spending limits empty if you only want free models.',
        'Copy the key (it usually starts with sk-or-…). Paste it into the box above and save in this app.',
        'Optional: free models are listed at openrouter.ai/models — look for names ending in “:free”.',
        'Keep the key private; do not share screenshots of it.',
      ],
    ),
    AiProviderInfo(
      id: AiProviderId.cerebras,
      displayName: 'Cerebras',
      poweredByLabel: 'Powered by Cerebras',
      keyStorageKey: 'api_key_cerebras',
      defaultModel: 'llama-3.3-70b',
      docsUrl: 'https://cloud.cerebras.ai',
      howToSteps: [
        'Open cloud.cerebras.ai in your browser and sign up or log in (email is enough; no card needed for free tier).',
        'In the left menu, open API Keys.',
        'Tap Create API Key and copy it when it appears (often only shown once).',
        'Paste the key into the box above in this app and tap Save AI keys.',
        'Treat the key like a password and do not share it.',
      ],
    ),
  ];

  static AiProviderInfo byId(AiProviderId id) =>
      all.firstWhere((p) => p.id == id);

  static const List<AiProviderId> defaultOrder = [
    AiProviderId.gemini,
    AiProviderId.groq,
    AiProviderId.cerebras,
    AiProviderId.openrouter,
  ];
}

class AiReply {
  final String text;
  final AiProviderId providerId;
  final String poweredByLabel;

  const AiReply({
    required this.text,
    required this.providerId,
    required this.poweredByLabel,
  });
}
