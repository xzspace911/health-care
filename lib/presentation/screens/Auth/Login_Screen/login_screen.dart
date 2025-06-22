import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/controllers/login_controller.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:health_care/presentation/screens/Auth/widgets/build_connect_with.dart';
import 'package:health_care/presentation/screens/Auth/widgets/build_forget_password.dart';
import 'package:health_care/presentation/screens/Auth/widgets/xtext_field.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class LoginScreen extends StatelessWidget {
  final loginController = Get.put(LoginController());
  // final registerController = Get.put(RegisterationController());
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: XResponsive.xHeight(context) / 1.8,
                decoration: BoxDecoration(
                  color: XColors.primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SizedBox(height: XResponsive.xHeight(context) / 30),
                      Row(
                        children: [
                          InkWell(
                            onTap: () => Navigator.of(context).pop(),
                            child: Container(
                              width: XResponsive.xWidth(context) / 7.5,
                              height: XResponsive.xHeight(context) / 16,
                              decoration: BoxDecoration(
                                color: XColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Iconsax.arrow_left_2_copy,
                                color: XColors.primary,
                              ),
                            ),
                          ),
                          SizedBox(width: XResponsive.xWidth(context) / 4.3),
                          Text(
                            XStrings.login,
                            style: TextStyle(
                              color: XColors.white,
                              fontSize: XResponsive.xHeight(context) / 31,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: XResponsive.xHeight(context) / 50),
                      Container(
                        width: XResponsive.xWidth(context),
                        height: XResponsive.xHeight(context) / 2.7,
                        decoration: BoxDecoration(
                            color: XColors.white,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              
                              XTextFieldOnscure(
                                controller: loginController.emailController, //? Email controller 
                                label: XStrings.email,
                                prefixIcon: Icon(Iconsax.personalcard_copy),
                                obscureText: false,
                              ),

                              
                              SizedBox(height: XResponsive.xHeight(context) / 50),

                              XTextFieldOnscure(
                                controller: loginController.passwordController, //? Password controller 
                                label: XStrings.password,
                                prefixIcon: Icon(Iconsax.password_check_copy),
                                obscureText: true,
                              ),

                              
                              SizedBox(height: XResponsive.xHeight(context) / 60),
                              BuildForgetPassword(),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: XResponsive.xHeight(context) / 30),
              BuildConnectWith(),
              SizedBox(height: XResponsive.xHeight(context) / 6),
              //◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘ Login Button ◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: XResponsive.xHeight(context) / 15,
                  child: ElevatedButton(
                    onPressed: () => loginController.loginWithEmail(), //? Login button controll action
                    style: ElevatedButton.styleFrom(
                      backgroundColor: XColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      XStrings.login,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: XResponsive.xHeight(context) / 42,
                      ),
                    ),
                  ),
                  //◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘◘
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
