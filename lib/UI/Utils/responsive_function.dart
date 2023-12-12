import 'package:flutter/material.dart';

class ResponsiveCalculator {
  final BuildContext context;

  ResponsiveCalculator(this.context);

  double calculateResponsiveHeight(double height) {
    double screenHeight = MediaQuery.of(context).size.height;
    return screenHeight * (height / 100.0);
  }

  double calculateResponsiveWidth(double width) {
    double screenWidth = MediaQuery.of(context).size.width;
    return screenWidth * (width / 100.0);
  }
}
