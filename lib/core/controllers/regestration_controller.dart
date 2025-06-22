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

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.baseUrl + ApiEndpoints.authEndPoints.registerEmail);

      Map body = {
        "firstName": firstNameController.text,
        "lastName": lastNameController.text,
        "email": emailController.text.trim(),
        "password": passwordController.text,
        "confirmPassword": confirmPasswordController.text,
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        Get.toNamed(XServicesStrings.createHealthProfile);
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;
          firstNameController.clear();
          lastNameController.clear();
          emailController.clear();
          passwordController.clear();
          confirmPasswordController.clear();
          levelController.clear();
          classController.clear();

          
        } else {
          throw json['message'] ?? 'Registration failed. Please try again.';
        }
        
      } else {
        throw jsonDecode(response.body)['message'] ?? 'Registration failed.';
      }
    } catch (e) {
      showDialog(
        context: Get.context!,
        builder: (context) {
          return SimpleDialog(
            title: Text(
              e.toString(),
              style: TextStyle(fontSize: 13),
            ),
            contentPadding: const EdgeInsets.all(20),
            children: [],
          );
        },
      );
    }
  }
}
