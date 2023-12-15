import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/error_message.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/otp_verification_field.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class OtpVerificationScreen extends StatefulWidget {
  String phoneNumber = '';
  dynamic countryCode;
  OtpVerificationScreen(
      {Key? key, required this.countryCode, required this.phoneNumber})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => OtpVerificationState();
}

class OtpVerificationState extends State<OtpVerificationScreen> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController phoneNumberController = TextEditingController();
  Map<String, dynamic> loginMap = {
    'dialCode': '+91',
    'isPhoneNumber': true,
    'Error': {
      'isError': false,
      'errorMessage': '',
    }
  };
  // dynamic dialCode = '+91';
  // bool isPhoneNumber = true;
  // dynamic _selectedCountry;
  @override
  Widget build(BuildContext context) {
    // CountryCode _selectedCountry = CountryCode.fromCode('IN');

    Strings string = Strings();
    ResponsiveCalculator calculator = ResponsiveCalculator(context);
    Images img = Images();
    final RegExp phoneNumberRegExp = RegExp(
        r'^(?:([0-9]{1})*[- .(]*([0-9]{3})[- .)]*[0-9]{3}[- .]*[0-9]{4})+$');
    bool isPhoneNumberValid(String value) {
      return phoneNumberRegExp.hasMatch(value);
    }

    void formValidation(value) {
      if (value!.isEmpty) {
        loginMap['Error']['isError'] = true;
        loginMap['Error']['errorMessage'] = 'Please enter a phone number.';
      } else if (!isPhoneNumberValid(value)) {
        loginMap['Error']['isError'] = true;
        loginMap['Error']['errorMessage'] = 'Invalid phone number format.';
      }
      return null;
    }

    return Scaffold(
        body: SafeArea(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: calculator.calculateResponsiveHeight(46),
            width: calculator.calculateResponsiveWidth(100),
            child: Image(
                image: AssetImage(img.imagesMap['otpLogin']),
                fit: BoxFit.cover,
                width: calculator.calculateResponsiveWidth(100),
                height: calculator.calculateResponsiveHeight(100)),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: calculator.calculateResponsiveHeight(33),
              left: calculator.calculateResponsiveHeight(5),
              right: calculator.calculateResponsiveHeight(5),
              // bottom: calculator.calculateResponsiveHeight(20),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: calculator.calculateResponsiveHeight(0)),
                  child: Container(
                      width: calculator.calculateResponsiveWidth(90),
                      height: calculator.calculateResponsiveHeight(5),
                      // clipBehavior: Clip.none,
                      // color: Colors.amberAccent,
                      child: ClipRRect(
                        clipBehavior: Clip.hardEdge,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: calculator.calculateResponsiveWidth(21.5),
                              height: calculator.calculateResponsiveHeight(0.2),
                              color: Colors.black,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                string.stringsMap['otpVerification']
                                    ['otpVerification'],
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: 'Roboto-Regular',
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              width: calculator.calculateResponsiveWidth(21.5),
                              height: calculator.calculateResponsiveHeight(0.2),
                              color: Colors.black,
                            ),
                          ],
                        ),
                      )),
                ),
                Form(
                    key: formkey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        Padding(
                            padding: EdgeInsets.only(
                                top: calculator.calculateResponsiveHeight(1),
                                bottom:
                                    calculator.calculateResponsiveHeight(2)),
                            child: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: calculator
                                          .calculateResponsiveWidth(0),
                                      vertical: calculator
                                          .calculateResponsiveHeight(1.5)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        string.stringsMap['otpVerification']
                                            ['otpSentHeading'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto-Medium'),
                                      ),
                                      Text(
                                        '${widget.countryCode}-${widget.phoneNumber}',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 15.5,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: 'Roboto-Medium'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: calculator
                                          .calculateResponsiveWidth(0),
                                      vertical: calculator
                                          .calculateResponsiveHeight(2)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      OtpVerificationField(),
                                      OtpVerificationField(),
                                      OtpVerificationField(),
                                      OtpVerificationField(),
                                    ],
                                  ),
                                ),
                                // Visibility(
                                //     visible:
                                //         loginMap['Error']['isError'] == true,
                                //     child: Container(
                                //       width: 10,
                                //       height: 10,
                                //       child: Align(
                                //         alignment: Alignment.centerRight,
                                //         child: ErrorMessage(
                                //           btnText: loginMap['Error']
                                //               ['errorMessage'],
                                //           padding: 2,
                                //         ),
                                //       ),
                                //     ))
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: calculator
                                          .calculateResponsiveWidth(0),
                                      vertical: calculator
                                          .calculateResponsiveHeight(1)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        string.stringsMap['otpVerification']
                                            ['noOtpContent'],
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'Roboto-Medium'),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        style: ButtonStyle(
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.only(left: 3)),
                                          overlayColor: MaterialStateProperty
                                              .resolveWith<Color>(
                                                  (Set<MaterialState> states) {
                                            if (states.contains(
                                                MaterialState.focused))
                                              return Colors.white;
                                            if (states.contains(
                                                MaterialState.hovered))
                                              return Colors.white;
                                            if (states.contains(
                                                MaterialState.pressed))
                                              return Colors.white;
                                            return Colors
                                                .white; // Defer to the widget's default.
                                          }),
                                        ),
                                        child: Text(
                                          string.stringsMap['otpVerification']
                                              ['reSendOtp'],
                                          style: TextStyle(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'Roboto-Medium'),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  calculator.calculateResponsiveHeight(1)),
                          child: Button(
                            borderColor: Theme.of(context).primaryColor,
                            btnText: string.stringsMap['otpVerification']
                                ['continue'],
                            btnBgColor: Theme.of(context).primaryColor,
                            btnTextColor:
                                Theme.of(context).secondaryHeaderColor,
                            onNavigation: () {
                              // logger.e(_selectedCountry);
                              if (formkey.currentState!.validate()) {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => LoginScreen()
                                //       ),
                                // );
                                formkey.currentState!.reset();
                              } else {
                                logger.i('I am not validated');
                              }
                            },
                            btnBorderRadius: 30.0,
                            padding: 7.0,
                            width: 100,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
