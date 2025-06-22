// ignore_for_file: unused_local_variable, avoid_print, unnecessary_nullable_for_final_variable_declarations

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/api_endpointes.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class GeneralInfoController extends GetxController {
  TextEditingController dateOfBirthController= TextEditingController();
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
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse(
          ApiEndpoints.patientBaseUrl + ApiEndpoints.authEndPoints.generalInfo);

      Map body = {
        "doctorEmail": doctorEmailController.text.trim(),
        "dateOfBirth": dateOfBirthController.text,
        "weight": weightController.hashCode,
        "height": heightController.hashCode,
        "hasSmokingHistory" : hasSmokingController.isBlank,
        "hasFamilyHistory" : hasFamilyController.isBlank,
        "diseases" : diseaseController.hashCode,
      };

      http.Response response = await http.post(url, body: jsonEncode(body), headers: headers);

      if (response.statusCode == 200) {
        Get.toNamed(XServicesStrings.loginScreen);
        final json = jsonDecode(response.body);
        if (json['code'] == 0) {
          var token = json['data']['Token'];
          print(token);
          final SharedPreferences? prefs = await _prefs;
          doctorEmailController.clear();
          dateOfBirthController.clear();
          weightController.clear();
          heightController.clear();
          hasSmokingController.clear();
          hasFamilyController.clear();
          diseaseController.clear();

          
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
