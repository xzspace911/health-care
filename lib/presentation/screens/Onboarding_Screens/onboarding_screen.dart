import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/images.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: XResponsive.xHeight(context) / 20),
              Image.asset(
                XImages.boardLogo,
                scale: XResponsive.xHeight(context) / 450,
              ),
              SizedBox(height: XResponsive.xHeight(context) / 30),
              Text(
                XStrings.healthCare,
                style: TextStyle(
                  fontSize: XResponsive.xHeight(context) / 25,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                XStrings.onBoardingSubTitle,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: XResponsive.xHeight(context) / 68,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: XResponsive.xHeight(context) / 30),
              SizedBox(
                width: double.infinity,
                height: XResponsive.xHeight(context) / 14,
                child: ElevatedButton(
                    onPressed: () => Navigator.of(context)
                        .pushNamed(XServicesStrings.loginScreen),
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(XColors.primary),
                      shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      XStrings.login,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: XResponsive.xHeight(context) / 40,
                      ),
                    )),
              ),
              SizedBox(height: XResponsive.xHeight(context) / 50),
              SizedBox(
                width: double.infinity,
                height: XResponsive.xHeight(context) / 14,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context)
                      .pushNamed(XServicesStrings.signUpScreen),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(XColors.white),
                    shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    XStrings.createAnAccount,
                    style: TextStyle(
                      color: XColors.primary,
                      fontSize: XResponsive.xHeight(context) / 44,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
