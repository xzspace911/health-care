import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/images.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class AiDoctor extends StatelessWidget {
  const AiDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(14),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(XServicesStrings.homeScreen),
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
                    SizedBox(width: XResponsive.xWidth(context) / 5.2),
                    Text(
                      XStrings.aiDoctor,
                      style: TextStyle(
                        color: XColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XResponsive.xHeight(context)/50),
                Container(
                  width: double.infinity,
                  height: XResponsive.xHeight(context)/1.18,
                  decoration: BoxDecoration(
                      color: XColors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: XResponsive.xHeight(context)/15,
                              width: XResponsive.xWidth(context)/1.4,
                              child: TextField(
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(28),
                                  ),
                                  hintText: XStrings.chatting,
                                  hintStyle: TextStyle(color: Colors.grey),
                                  suffixIcon: Icon(
                                    Iconsax.microphone_copy,
                                    color: XColors.primary,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: XResponsive.xWidth(context)/40),
                            CircleAvatar(
                              backgroundColor: XColors.primary,
                              minRadius: 24,
                              child: Image.asset(XImages.arrowIcon),
                            ),
                          ],
                        ),
                        SizedBox(height: XResponsive.xHeight(context)/90),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
