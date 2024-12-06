class AppEnv {
  static const String env = String.fromEnvironment('APP_ENV');
  static const String baseUrl = String.fromEnvironment('SUPABASE_BASE_URL');
  static const String anonKey = String.fromEnvironment('SUPABASE_ANON_KEY');
  static const String oneSignalAppId =
      String.fromEnvironment('ONESIGNAL_APP_ID');
  static const String apiBaseUrl = String.fromEnvironment('API_BASE_URL');
  static const String webSocketUrl = String.fromEnvironment('WEB_SOCKET_URL');
  static const String gameUrl = String.fromEnvironment('GAME_URL');
}
