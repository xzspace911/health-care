// ignore_for_file: library_private_types_in_public_api

class ApiEndpoints {
  static const String baseUrl = 'https://graduationpro.runasp.net/api/Auth/';
  static const String patientBaseUrl = 'https://graduationpro.runasp.net/api/Patient/';
  static const String ml = "https://graduationpro.runasp.net/api/ML/";
  static _AuthEndPoints authEndPoints = _AuthEndPoints();

}

class _AuthEndPoints{
  final String registerEmail = 'register';
  final String loginEmail = 'login';
  final String forgotPassword = 'forgot-password';

  final String generalInfo = 'general-info';

  final String diabetes = 'diabetes-prediction';
  final String heartPressure = 'blood-pressure-prediction';
  final String pluseRate = 'heart-disease-prediction';
}