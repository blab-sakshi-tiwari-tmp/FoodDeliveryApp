import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class OtpVerificationField extends StatelessWidget {
  // Color  btnTextColor;
  // String btnText;
  // double width, padding;
  // ErrorMessage({
  //   required this.btnText,
  //   this.width = 0,
  //   this.padding = 5,
  // });
  @override
  Widget build(BuildContext context) {
    ResponsiveCalculator calculator = ResponsiveCalculator(context);

    return SizedBox(
      width: calculator.calculateResponsiveHeight(6),
      height: calculator.calculateResponsiveHeight(6),
      child: TextFormField(
        textAlign: TextAlign.center,
        // validator: (value) {
        //   formValidation(value);
        // },
        // controller: phoneNumberController,
        keyboardType: TextInputType.phone,
        style: TextStyle(fontSize: 25, color: Theme.of(context).primaryColor),
        maxLength: 1,
        decoration: InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.only(
              top: calculator.calculateResponsiveHeight(0),
              bottom: calculator.calculateResponsiveHeight(8)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xffC3BEBD),
                width: 1.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8.0))),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: 1.5,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
          ),
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: const Color(0xffC3BEBD),
                width: 1.5,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0))),
        ),
        onChanged: (val) {
          if (val != '') {
            // setState(() {
            //   loginMap['isPhoneNumber'] = true;
            // });
          }
          logger.d(val);
        },
      ),
    );
  }
}
