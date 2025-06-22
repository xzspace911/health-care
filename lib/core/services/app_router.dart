import 'package:flutter/material.dart';
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

class AppRouter {
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XServicesStrings.onboardingScreen:
        return MaterialPageRoute(builder: (_) => OnboardingScreen());

      case XServicesStrings.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());

      case XServicesStrings.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignupScreen());

      case XServicesStrings.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case XServicesStrings.createHealthProfile:
        return MaterialPageRoute(builder: (_) => CreatingHealthProfile());

      case XServicesStrings.aiDoctorScreen:
        return MaterialPageRoute(builder: (_) => AiDoctor());

      case XServicesStrings.heartPressure:
        return MaterialPageRoute(builder: (_) => HeartPressure());

      case XServicesStrings.sugarInBlood:
        return MaterialPageRoute(builder: (_) => SugarInBlood());

      case XServicesStrings.clinic:
        return MaterialPageRoute(builder: (_) => Clinic());

      case XServicesStrings.pulseRate:
        return MaterialPageRoute(builder: (_) => PluseRate());
    }
  }
}
