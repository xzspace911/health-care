import 'package:flutter/material.dart';
import 'package:health_care/presentation/Utils/colors.dart';
import 'package:health_care/presentation/Utils/responsive.dart';
import 'package:health_care/presentation/Utils/strings.dart';

class AppFunctions extends StatelessWidget {
  const AppFunctions({
    super.key,
    required this.color,
    required this.image,
    required this.name,
    required this.onPressed,
  });
  final Color color;
  final String image;
  final String name;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: color.withAlpha(75),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white.withAlpha(50),
            child: Image.asset(image,
            scale: XResponsive.xHeight(context)/150,
            ),
          ),
          SizedBox(height: XResponsive.xHeight(context) / 80),
          Text(
            name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: XResponsive.xHeight(context) / 60),
          SizedBox(
            width: XResponsive.xWidth(context)/3.5,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
              child: Text(
                XStrings.register,
                style: TextStyle(
                  color: XColors.white,
                  fontSize: XResponsive.xHeight(context) / 65,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
