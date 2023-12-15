import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class ErrorMessage extends StatelessWidget {
  // Color  btnTextColor;
  String btnText;
  double width, padding;
  ErrorMessage({
    required this.btnText,
    this.width = 0,
    this.padding = 5,
  });
  @override
  Widget build(BuildContext context) {
    ResponsiveCalculator calculator = ResponsiveCalculator(context);

    return Container(
        width: calculator.calculateResponsiveWidth(90),
        height: calculator.calculateResponsiveHeight(5),
        // height: calculator.calculateResponsiveHeight(5),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: Text(
            btnText,
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.red,
                fontFamily: 'Roboto-Regular'),
          ),
        ));
  }
}
