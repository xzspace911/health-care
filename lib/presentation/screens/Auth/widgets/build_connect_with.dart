import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/images.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';

class BuildConnectWith extends StatelessWidget {
  const BuildConnectWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
                width: XResponsive.xWidth(context) / 1.5,
                height: XResponsive.xHeight(context) / 18,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: XColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: Colors.grey.withAlpha(120),
                      ),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: XResponsive.xWidth(context) / 22),
                      Image.asset(
                        XImages.googleIcon,
                        scale: XResponsive.xHeight(context) / 37,
                      ),
                      SizedBox(width: XResponsive.xWidth(context) / 33),
                      Text(
                        XStrings.loginGoogle,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: XResponsive.xHeight(context) / 45),
              SizedBox(
                width: XResponsive.xWidth(context) / 1.5,
                height: XResponsive.xHeight(context) / 18,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: XColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(color: Colors.grey.withAlpha(120)),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        XImages.appleIcon,
                        scale: XResponsive.xHeight(context) / 9,
                      ),
                      Text(
                        XStrings.loginApple,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ],
    );
  }
}