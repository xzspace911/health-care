// ignore_for_file: unused_local_variable, unused_field, empty_catches, avoid_print

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/api_endpointes.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.loginEmail);

      Map body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      final json = jsonDecode(response.body);

      if (response.statusCode == 200 && json['accessToken'] != null) {
        final SharedPreferences prefs = await _prefs;

        // ✅ Save token and patient_id with correct keys
        await prefs.setString('token', json['accessToken']);
        await prefs.setString('patient_id', json['patient_id'].toString());

        emailController.clear();
        passwordController.clear();

        Get.toNamed(XServicesStrings.homeScreen);
      } else {
        throw jsonDecode(response.body)['Message'] ?? 'Unknown error occurred';
      }
    } catch (e) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Error', style: TextStyle(color: Colors.red)),
            contentPadding: const EdgeInsets.all(20),
            children: const [
              Text(
                'Invalid email or password',
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          );
        },
      );
    }
  }
}
