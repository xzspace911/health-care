// ignore_for_file: unused_local_variable, avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/api_endpointes.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RegisterationController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController levelController = TextEditingController(text: "4");
  TextEditingController classController = TextEditingController(text: "10");

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail(BuildContext context) async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
        ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.registerEmail,
      );

      Map<String, dynamic> body = {
        "firstName": firstNameController.text.trim(),
        "lastName": lastNameController.text.trim(),
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text,
      };

      http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      final json = jsonDecode(response.body);

      print('Status Code: ${response.statusCode}');
      print('Response JSON: $json');

      if (response.statusCode == 200 && json['message'] == 'Registration successful.') {
        // Check if token exists in response (optional, based on API)
        String? token;
        if (json['data'] != null && json['data']['Token'] != null) {
          token = json['data']['Token'];
          final SharedPreferences prefs = await _prefs;
          await prefs.setString('token', token.toString());
          print('Saved token: $token');
        } else {
          print('No token provided in response');
        }

        // Clear text fields
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
        levelController.clear();
        classController.clear();

        // Navigate to Create Health Profile
        print('Navigating to Create Health Profile...');
        Get.toNamed(XServicesStrings.loginScreen);
      } else {
        throw json['message'] ?? 'Registration failed. Please try again.';
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              e.toString(),
              style: const TextStyle(fontSize: 13),
            ),
            contentPadding: const EdgeInsets.all(20),
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }
}
