class ApiEndPoints {
  static const String baseUrl = "http://restapi.com/v1/endpoints";
  static _AuthEndPoints authEndPoint = _AuthEndPoints();
}

class _AuthEndPoints {
  final String registerEmail = 'authaccount/registration';
  final String loginEmail = 'authaccount/login';
}
