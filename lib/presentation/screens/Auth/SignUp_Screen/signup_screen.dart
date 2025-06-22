import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_care/core/controllers/regestration_controller.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:health_care/presentation/screens/Auth/widgets/build_connect_with.dart';
import 'package:health_care/presentation/screens/Auth/widgets/xtext_field.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SignupScreen extends StatelessWidget {
  final registerationController = Get.put(RegisterationController());
  SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: XResponsive.xHeight(context) / 1.55,
              decoration: BoxDecoration(
                color: XColors.primary,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(height: XResponsive.xHeight(context) / 22),
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
                        SizedBox(width: XResponsive.xWidth(context) / 4.62),
                        Text(
                          XStrings.signUp,
                          style: TextStyle(
                            color: XColors.white,
                            fontSize: XResponsive.xHeight(context) / 33,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: XResponsive.xHeight(context) / 50),
                    Container(
                      width: XResponsive.xWidth(context),
                      height: XResponsive.xHeight(context) / 2.1,
                      decoration: BoxDecoration(
                          color: XColors.white,
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: XResponsive.xHeight(context) / 11,
                                  width: XResponsive.xWidth(context) / 2.6,
                                  child: XTextFieldOnscure(
                                    controller: registerationController
                                        .firstNameController,
                                    label: XStrings.firstName,
                                    obscureText: false,
                                  ),
                                ),
                                SizedBox(
                                    width: XResponsive.xWidth(context) / 42),
                                SizedBox(
                                  height: XResponsive.xHeight(context) / 11,
                                  width: XResponsive.xWidth(context) / 2.6,
                                  child: XTextFieldOnscure(
                                    controller: registerationController
                                        .lastNameController,
                                    label: XStrings.lastName,
                                    obscureText: false,
                                  ),
                                ),
                              ],
                            ),
                            XTextFieldOnscure(
                              controller:
                                  registerationController.emailController,
                              label: XStrings.email,
                              obscureText: false,
                              prefixIcon: Icon(Iconsax.personalcard_copy),
                            ),
                            XTextFieldOnscure(
                              controller:
                                  registerationController.passwordController,
                              label: XStrings.password,
                              obscureText: true,
                              prefixIcon: Icon(Iconsax.password_check_copy),
                            ),
                            XTextFieldOnscure(
                              controller: registerationController
                                  .confirmPasswordController,
                              label: XStrings.confirmPassword,
                              obscureText: true,
                              prefixIcon: Icon(Iconsax.password_check_copy),
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  value: true,
                                  onChanged: (value) {},
                                  activeColor: XColors.primary,
                                ),
                                Text(
                                  XStrings.rememberMe,
                                  style: TextStyle(
                                    color: XColors.primary,
                                    fontSize: XResponsive.xHeight(context) / 55,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: XResponsive.xHeight(context) / 20),
            BuildConnectWith(),
            SizedBox(height: XResponsive.xHeight(context) / 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                height: XResponsive.xHeight(context) / 15,
                child: ElevatedButton(
                  onPressed: () => registerationController.registerWithEmail(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: XColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    XStrings.createYourProfile,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: XResponsive.xHeight(context) / 45,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
