import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:health_care/presentation/widgets/build_chart.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class PluseRate extends StatelessWidget {
  const PluseRate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: XColors.primary,
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    SizedBox(width: XResponsive.xWidth(context) / 8),
                    Text(
                      XStrings.pulseRate,
                      style: TextStyle(
                        color: XColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: XResponsive.xHeight(context) / 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XResponsive.xHeight(context) / 80),
                Row(
                  children: [
                    Text(
                      XStrings.detail,
                      style: TextStyle(
                        color: XColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: XResponsive.xHeight(context) / 40,
                      ),
                    ),
                    SizedBox(width: XResponsive.xWidth(context) / 15),
                    Container(
                      width: XResponsive.xWidth(context) / 1.45,
                      height: XResponsive.xHeight(context) / 25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: XColors.primary,
                        border: Border.all(color: XColors.white),
                      ),
                      child: Center(
                        child: Text(
                          XStrings.date,
                          style: TextStyle(
                            color: XColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: XResponsive.xHeight(context) / 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XResponsive.xHeight(context) / 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
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
                    Text(
                      XStrings.average,
                      style: TextStyle(
                        color: XColors.white,
                        fontSize: XResponsive.xHeight(context) / 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      width: XResponsive.xWidth(context) / 7.5,
                      height: XResponsive.xHeight(context) / 16,
                      decoration: BoxDecoration(
                        color: XColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Iconsax.arrow_right_3_copy,
                        color: XColors.primary,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: XResponsive.xHeight(context) / 80),
                Container(
                  width: double.infinity,
                  height: XResponsive.xHeight(context) / 1.4,
                  decoration: BoxDecoration(
                    color: XColors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                XStrings.bpm,
                                style: TextStyle(
                                  color: XColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                '96',
                                style: TextStyle(
                                  color: XColors.primary,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                        BuildChart(),
                        SizedBox(height: XResponsive.xHeight(context) / 10),
                        SizedBox(
                          width: double.infinity,
                          height: XResponsive.xHeight(context) / 14,
                          child: ElevatedButton(
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: XColors.primary,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.add_circle,
                                  color: XColors.white,
                                ),
                                SizedBox(width: XResponsive.xWidth(context) / 50),
                                Text(
                                  XStrings.addRecord,
                                  style: TextStyle(
                                    color: XColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: XResponsive.xHeight(context) / 42,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
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