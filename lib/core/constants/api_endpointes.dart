// ignore_for_file: library_private_types_in_public_api

class ApiEndpoints {
  static const String baseUrl = 'https://graduationpro.runasp.net/api/Auth/';
  static const String patientBaseUrl = 'https://graduationpro.runasp.net/api/Patient/';
  static _AuthEndPoints authEndPoints = _AuthEndPoints();

}

class _AuthEndPoints{
  final String registerEmail = 'register';
  final String loginEmail = 'login';
  final String forgotPassword = 'forgot-password';

  final String generalInfo = 'general-info';
}