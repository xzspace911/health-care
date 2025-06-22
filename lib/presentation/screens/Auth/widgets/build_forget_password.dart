import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';

class BuildForgetPassword extends StatelessWidget {
  const BuildForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
