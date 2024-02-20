class BaseAPI {
  static String base = "http://localhost:3000";
  static var api = base + "/api/v1";
  var customersPath = api + "/customers";
  var authPath = api + "/auth";
  var logoutPath = api + "/logout";
  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}
