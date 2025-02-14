import 'package:flutter/material.dart';

double screenWidth(BuildContext context) => MediaQuery.sizeOf(context).width;
double screenHeight(BuildContext context) => MediaQuery.sizeOf(context).height;

class SizeConfig {
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}
