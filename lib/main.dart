import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/screens/Auth/Login_Screen/login_screen.dart';
import 'package:health_care/presentation/screens/Auth/SignUp_Screen/creating_health_profile.dart';
import 'package:health_care/presentation/screens/Auth/SignUp_Screen/signup_screen.dart';
import 'package:health_care/presentation/screens/Home/home_screen.dart';
import 'package:health_care/presentation/screens/Onboarding_Screens/onboarding_screen.dart';
import 'package:health_care/presentation/screens/ai_doctor/ai_doctor.dart';
import 'package:health_care/presentation/screens/clinic/clinic.dart';
import 'package:health_care/presentation/screens/heart_pressure/heart_pressure.dart';
import 'package:health_care/presentation/screens/pluse_rate/pluse_rate.dart';
import 'package:health_care/presentation/screens/sugar_in_blood/sugar_in_blood.dart';

void main() {
  runApp(HealthCare());
}

class HealthCare extends StatelessWidget {
  const HealthCare({super.key});
  // final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: XServicesStrings.onboardingScreen,
      getPages: [
        GetPage(name: XServicesStrings.onboardingScreen, page: ()=> OnboardingScreen()),
        GetPage(name: XServicesStrings.loginScreen, page: ()=> LoginScreen()),
        GetPage(name: XServicesStrings.signUpScreen, page: ()=> SignupScreen()),
        GetPage(name: XServicesStrings.createHealthProfile, page: ()=> CreatingHealthProfile()),
        GetPage(name: XServicesStrings.homeScreen, page: ()=> HomeScreen()),
        GetPage(name: XServicesStrings.aiDoctorScreen, page: ()=> AiDoctor()),
        GetPage(name: XServicesStrings.heartPressure, page: ()=> HeartPressure()),
        GetPage(name: XServicesStrings.sugarInBlood, page: ()=> SugarInBlood()),
        GetPage(name: XServicesStrings.clinic, page: ()=> Clinic()),
        GetPage(name: XServicesStrings.pulseRate, page: ()=> PluseRate()),
      ],
    );
  }
}
