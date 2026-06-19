class NetworkConfig {
  /// Инструкция для подключения:
  /// 1. http://localhost:8080 — для ios симулятора или запуска в браузере
  /// 2. http://10.0.2.2:8080   — для android эмулятора
  /// 3. http://192.168.x.x:8080 — для реального телефона (IP ПК)

  // Авторизация и тренировки на Go
  static const String baseUrl = 'http://10.0.2.2:8080';

  // Аднмика на Python
  static const String pythonBaseUrl = 'http://10.0.2.2:8000';

  // Endpoints
  static const String login = '/login';
  static const String register = '/register';
  static const String refreshToken = '/refresh-token';
  static const String logout = '/logout';
  static const String createUser = '/create-user';
  static const String getUser = '/get-user';
}