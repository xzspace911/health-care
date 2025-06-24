// --- GeneralInfoController (Updated for Full GetX Routing) ---

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/api_endpointes.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GeneralInfoController extends GetxController {
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController hasSmokingController = TextEditingController();
  TextEditingController hasFamilyController = TextEditingController();
  TextEditingController doctorEmailController = TextEditingController();
  TextEditingController diseaseController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerGeneralInfo() async {
    try {
      final SharedPreferences prefs = await _prefs;
      final token = prefs.getString('token');

      print('Retrieved Token: $token');

      final headers = {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      };

      final url = Uri.parse(
        ApiEndpoints.patientBaseUrl + ApiEndpoints.authEndPoints.generalInfo,
      );

      final Map<String, dynamic> body = {
        "doctorEmail": doctorEmailController.text.trim(),
        "dateOfBirth": dateOfBirthController.text.trim(),
        "gender": genderController.text.trim(),
        "weight": double.tryParse(weightController.text.trim()) ?? 0.0,
        "height": double.tryParse(heightController.text.trim()) ?? 0.0,
        "hasSmokingHistory": hasSmokingController.text.trim().toLowerCase() == 'yes',
        "hasFamilyHistory": hasFamilyController.text.trim().toLowerCase() == 'yes',
        "diseases": int.tryParse(diseaseController.text.trim()) ?? 0,
      };

      print('Request Body: ${jsonEncode(body)}');

      final http.Response response = await http.post(
        url,
        body: jsonEncode(body),
        headers: headers,
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: "${response.body}"');

      if (response.statusCode == 401) {
        throw 'Unauthorized. Please log in again. (Missing or invalid token)';
      }

      if (response.body.trim().isEmpty) {
        throw 'Empty response from server.';
      }

      final json = jsonDecode(response.body);

      if (response.statusCode == 200 && json['success'] == true) {
        doctorEmailController.clear();
        dateOfBirthController.clear();
        weightController.clear();
        heightController.clear();
        hasSmokingController.clear();
        hasFamilyController.clear();
        diseaseController.clear();
        genderController.clear();

        Get.toNamed(XServicesStrings.loginScreen);
      } else {
        throw json['message'] ?? 'Registration failed. Please try again.';
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
