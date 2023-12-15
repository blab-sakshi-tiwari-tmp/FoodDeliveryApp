import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Button extends StatelessWidget {
  Color btnBgColor, btnTextColor;
  String btnText;
  Color borderColor;
  double padding, btnBorderRadius;
  Function onNavigation;
  double height, width;
  Button(
      {required this.btnText,
      this.btnBorderRadius = 0,
      this.padding = 0,
      this.borderColor = Colors.white,
      required this.btnBgColor,
      required this.btnTextColor,
      required this.onNavigation,
      this.height = double.infinity,
      this.width = 0});
  @override
  Widget build(BuildContext context) {
    ResponsiveCalculator calculator = ResponsiveCalculator(context);

    return Container(
      width: width != 0
          ? calculator.calculateResponsiveWidth(width)
          : calculator.calculateResponsiveWidth(90),
      height: calculator.calculateResponsiveHeight(5),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: btnTextColor,
              backgroundColor: btnBgColor,
              padding: EdgeInsets.all(padding),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: borderColor, width: 1.0),
                borderRadius: BorderRadius.circular(btnBorderRadius),
              )),
          child: Text(btnText),
          onPressed: () {
            onNavigation();
          }),
    );
  }
}
