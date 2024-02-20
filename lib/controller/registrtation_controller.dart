import 'dart:convert';
import 'package:api_auth/url/api_url.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {
  final Future<SharedPreferences> getPreferences =
      SharedPreferences.getInstance();

  Future<void> registrationWithEmail(
      String name, String email, String password) async {
    try {
      var headers = {'content-type': 'application/json'};
      var url = Uri.parse(
          ApiEndPoints.baseUrl + ApiEndPoints.authEndPoint.registerEmail);

      Map body = {
        'name': name,
        'email': email,
        'password': password,
      };

      http.Response response =
          await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        if (json['code'] == 0) {
          var token = json['data']['token'];
          print(token);

          final SharedPreferences preferences = await getPreferences;

          await preferences.setString('token', token);
          // nameController.clear();
          // emailController.clear();
          // passwordController.clear();
        } else {
          throw jsonDecode(response.body)['message'] ?? "Unknown error";
        }
      } else {
        throw jsonDecode(response.body)['message'] ?? "Unknown error";
      }
    } catch (e) {
      Get.back();
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Error"),
            contentPadding: const EdgeInsets.all(20),
            children: [Text(e.toString())],
          );
        },
      );
    }
  }
}
