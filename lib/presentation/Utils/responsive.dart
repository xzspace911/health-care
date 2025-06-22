import 'package:flutter/material.dart';

class XResponsive{
  static double xWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double xHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}