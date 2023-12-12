import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Button extends StatelessWidget {
  Color btnBgColor, btnTextColor;
  String btnText;
  double padding, btnBorderRadius;
  // String
  Button(
      {required this.btnText,
      this.btnBorderRadius = 0,
      this.padding = 0,
      required this.btnBgColor,
      required this.btnTextColor});
  @override
  Widget build(BuildContext context) {
    Strings string = Strings();

    return Scaffold(
      body: ElevatedButton(
          style: ElevatedButton.styleFrom(
              foregroundColor: btnTextColor,
              backgroundColor: btnBgColor,
              padding: EdgeInsets.all(padding),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(btnBorderRadius),
              )),
          child: Text(btnText),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => Account()),
            // );
          }),
    );
  }
}
