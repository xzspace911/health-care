import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/core/constants/api_endpointes.dart';

class HeartPressureController extends GetxController {
  // Text editing controllers for inputs
  final systolicController = TextEditingController();
  final diastolicController = TextEditingController();
  final pulseController = TextEditingController();
  final sleepDurationController = TextEditingController();
  final qualityOfSleepController = TextEditingController();
  final physicalActivityController = TextEditingController();
  final stressLevelController = TextEditingController();
  final dailyStepsController = TextEditingController();

  // Base URL
  final String url = ApiEndpoints.ml + ApiEndpoints.authEndPoints.heartPressure;

  Future<void> submitPrediction() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      // ✅ Use the same keys saved during login
      final token = prefs.getString("token") ?? "";
      final patientId = prefs.getString("patient_id") ?? "";

      final fullUrl = Uri.parse('$url?patient_id=$patientId');

      final body = {
        "systolic": int.parse(systolicController.text.trim()),
        "diastolic": int.parse(diastolicController.text.trim()),
        "pulse": 70,
        "sleep_Duration": int.parse(sleepDurationController.text.trim()),
        "quality_of_Sleep": int.parse(qualityOfSleepController.text.trim()),
        "physical_Activity_Level": int.parse(physicalActivityController.text.trim()),
        "stress_Level": 4,
        "daily_Steps": 5000,
      };

      // 🔍 Debug log for everything
      print("🔄 Sending Heart Pressure Prediction Request...");
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

        final message = data["data"]["message"] ?? "Prediction completed.";

        Get.snackbar(
          'Result', // or "Prediction Result"
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
