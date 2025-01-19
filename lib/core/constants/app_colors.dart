import 'package:flutter/material.dart';
import 'package:flutter_flavor/flutter_flavor.dart';

class AppColors {
  AppColors._();
  // static const Color primaryColor = Color(0XFFE85520);
  static final Color primaryColor = FlavorConfig.instance.variables['primaryColor'];

  static const Color secondaryColor = Colors.green;
  static const Color whiteColor = Colors.white;
  static const textColor = Color(0xff353047);
  static const Color greyColor = Colors.grey;
  static Color textFormFieldColor = Colors.grey.shade200;

  // light theme
  // static Color scafLightBackground = Color(0xFFfafafa);
  static Color scafLightBackground = Colors.grey.shade100;
  static Color containerLight = Color(0xFFd2d3db);

  // dark theme
  static Color scafDarkBackground = Color(0xFF121212);
  static Color containerDark = Color(0xFF282828);
}
