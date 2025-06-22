import 'package:flutter/material.dart';
import 'package:health_care/core/constants/services_strings.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/images.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';
import 'package:health_care/presentation/screens/Home/widgets/app_functions.dart';
import 'package:health_care/presentation/widgets/bottom_navigation_bar.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: XResponsive.xHeight(context)/40),
                        Text(
                          XStrings.home,
                          style: TextStyle(
                            fontSize: XResponsive.xHeight(context)/32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: XResponsive.xHeight(context)/45),
                        Container(
                          height: XResponsive.xHeight(context)/4.4,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: XColors.lightRed,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 100,
                                left: 120,
                                child: Container(
                                  width: XResponsive.xWidth(context)/1.65,
                                  height: XResponsive.xHeight(context)/10,
                                  decoration: BoxDecoration(
                                    color: XColors.midRed.withAlpha(50),
                                    borderRadius: BorderRadius.circular(120),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 105,
                                left: 30,
                                child: Container(
                                  width: XResponsive.xWidth(context)/1.1,
                                  height: XResponsive.xHeight(context)/10,
                                  decoration: BoxDecoration(
                                      color: XColors.midRed.withAlpha(50),
                                      borderRadius: BorderRadius.circular(120)),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(14),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(XImages.heartImage,
                                    scale: XResponsive.xHeight(context)/150,
                                    ),
                                    SizedBox(width: XResponsive.xWidth(context)/8),
                                    Column(
                                      children: [
                                        SizedBox(height: XResponsive.xHeight(context)/120),
                                        Text(
                                          XStrings.pulseRate,
                                          style: TextStyle(
                                            fontSize: XResponsive.xHeight(context)/33,
                                            fontWeight: FontWeight.w600,
                                            color: XColors.white,
                                          ),
                                        ),
                                        SizedBox(height: XResponsive.xHeight(context)/180),
                                        SizedBox(
                                          width: XResponsive.xWidth(context)/2.4,
                                          child: ElevatedButton(
                                            onPressed: ()=>Navigator.of(context).pushNamed(XServicesStrings.pulseRate),
                                            style: ButtonStyle(
                                              shape: WidgetStatePropertyAll<
                                                  RoundedRectangleBorder>(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              XStrings.measurement,
                                              style: TextStyle(
                                                fontSize: XResponsive.xHeight(context)/50,
                                                color: XColors.primary,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  SizedBox(height: XResponsive.xHeight(context)/7.8),
                                  Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 14, 10, 14),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ButtonStyle(
                                            backgroundColor:
                                                WidgetStatePropertyAll(XColors
                                                    .white
                                                    .withAlpha(90)),
                                            shape: WidgetStatePropertyAll<
                                                RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                              ),
                                            ),
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "Last Date : 22.2.2025",
                                                style: TextStyle(
                                                  color: XColors.white,
                                                ),
                                              ),
                                              SizedBox(width: XResponsive.xWidth(context)/8),
                                              Text(
                                                "Register",
                                                style: TextStyle(
                                                  color: XColors.white,
                                                ),
                                              ),
                                              SizedBox(width: XResponsive.xWidth(context)/40),
                                              Icon(
                                                Iconsax.arrow_right_2_copy,
                                                color: XColors.white,
                                              ),
                                            ],
                                          )),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: XResponsive.xHeight(context)/1.7,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: XResponsive.xHeight(context)/915,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      AppFunctions(
                        color: XColors.green,
                        image: XImages.doctorImage,
                        name: XStrings.aiDoctor,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(XServicesStrings.aiDoctorScreen),
                      ),
                      AppFunctions(
                        color: XColors.purble,
                        image: XImages.pressureImage,
                        name: XStrings.heartPressure,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(XServicesStrings.heartPressure),
                      ),
                      AppFunctions(
                        color: XColors.orange,
                        image: XImages.bloodImage,
                        name: XStrings.sugarInBlood,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(XServicesStrings.sugarInBlood),
                      ),
                      AppFunctions(
                        color: XColors.blue,
                        image: XImages.clinicImage,
                        name: XStrings.clinic,
                        onPressed: () => Navigator.of(context)
                            .pushNamed(XServicesStrings.clinic),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: XBottomNavigationBar(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
