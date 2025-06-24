import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/core/constants/api_endpointes.dart';

class DiabetesPredictionController extends GetxController {
  // Text controllers for input fields
  final genderController = TextEditingController();
  final ageController = TextEditingController();
  final hypertensionController = TextEditingController();
  final heartDiseaseController = TextEditingController();
  final smokingHistoryController = TextEditingController();
  final bmiController = TextEditingController();
  final hbA1cLevelController = TextEditingController();
  final bloodGlucoseLevelController = TextEditingController();
  final patientTypeController = TextEditingController();
  final isFasting = false.obs;

  final String url = ApiEndpoints.ml + ApiEndpoints.authEndPoints.diabetes;

  Future<void> submitPrediction() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString("token") ?? "";
      final patientId = prefs.getString("patient_id") ?? "";

      final fullUrl = Uri.parse('$url?patient_id=1');

      final body = {
        "gender": 'male',
        "age": 45,
        "hypertension": int.parse(hypertensionController.text.trim()),
        "heart_Disease": int.parse(heartDiseaseController.text.trim()),
        "smoking_History": 'never',
        "bmi": 1,
        "hbA1c_level": double.parse(hbA1cLevelController.text.trim()),
        "blood_Glucose_Level": int.parse(bloodGlucoseLevelController.text.trim()),
        "patient_Type": 'type 1',
        "is_Fasting": true,
      };

      // Debug logs
      print("🔄 Sending Diabetes Prediction Request...");
      print("🔐 Token: $token");
      print("🧍‍♂️ Patient ID: $patientId");
      print("🌐 URL: $fullUrl");
      print("📦 Request Body:");
      body.forEach((key, value) => print("  - $key: $value"));

      final response = await http.post(
        fullUrl,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token",
        },
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Full response: ${jsonEncode(data)}");

        final message = data["message"] ?? "Prediction completed.";

        Get.snackbar(
          "نتيجة التنبؤ", // Or "Prediction Result"
          message,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM,
          duration: const Duration(seconds: 5),
        );
      } else {
        print("❌ Failed with status code: ${response.statusCode}");
        print("📨 Response Body: ${response.body}");
        Get.snackbar("Error", "Server error: ${response.statusCode}");
      }
    } catch (e) {
      print("🚨 Exception occurred: $e");
      Get.snackbar("Error", "Invalid input or network error");
    }
  }
}
