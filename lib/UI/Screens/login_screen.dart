import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/error_message.dart';
import 'package:food_delivery_app/UI/Screens/otp_verification.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginState();
}

class LoginState extends State<LoginScreen> {
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
        // setState(() {
        //   loginMap['Error']['isError'] =
        //       true;
        //   loginMap['Error']
        //           ['errorMessage'] =
        //       'Please enter a phone number.';
        // });

        // return 'Please enter a phone number.';
      } else if (!isPhoneNumberValid(value)) {
        loginMap['Error']['isError'] = true;
        loginMap['Error']['errorMessage'] = 'Invalid phone number format.';
      }
      return null;
    }

    FocusScopeNode _focusScopeNode = FocusScopeNode();

    @override
    void dispose() {
      _focusScopeNode.dispose();
      super.dispose();
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: GestureDetector(
                onTap: () {
                  // Unfocus when the user taps outside the focused area
                  _focusScopeNode.unfocus();
                },
                child: FocusScope(
                  node: _focusScopeNode,
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
                          top: calculator.calculateResponsiveHeight(20),
                          left: calculator.calculateResponsiveWidth(5),
                          right: calculator.calculateResponsiveWidth(5),
                          // bottom: calculator.calculateResponsiveHeight(20),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical:
                                      calculator.calculateResponsiveHeight(2)),
                              child: Container(
                                  width:
                                      calculator.calculateResponsiveWidth(90),
                                  height:
                                      calculator.calculateResponsiveHeight(5),
                                  // clipBehavior: Clip.none,
                                  child: ClipRRect(
                                    clipBehavior: Clip.hardEdge,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Container(
                                          width: calculator
                                              .calculateResponsiveWidth(90),
                                          height: calculator
                                              .calculateResponsiveHeight(0.2),
                                          color: Colors.black,
                                        ),
                                        Positioned(
                                          bottom: calculator
                                              .calculateResponsiveHeight(1),
                                          child: Container(
                                            color: Colors.white,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              string.stringsMap['login']
                                                  ['logloginHeading2'],
                                              style: const TextStyle(
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily: 'Roboto-Regular',
                                                  color: Colors.black),
                                            ),
                                          ),
                                        )
                                        // Container(
                                        //   width: calculator.calculateResponsiveWidth(21.5),
                                        //   height: calculator.calculateResponsiveHeight(0.2),
                                        //   color: Colors.black,
                                        // ),
                                      ],
                                    ),
                                  )),
                            ),
                            Form(
                                key: formkey,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                child: Column(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: calculator
                                                .calculateResponsiveHeight(3)),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                SingleChildScrollView(
                                                    child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    width: calculator
                                                        .calculateResponsiveWidth(
                                                            22),
                                                    height: calculator
                                                        .calculateResponsiveHeight(
                                                            6),
                                                    decoration: BoxDecoration(
                                                      // color: Colors.blue, // Background color
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15), // Border radius
                                                      border: Border.all(
                                                        color: Theme.of(context)
                                                            .primaryColor, // Border color
                                                        width:
                                                            1, // Border width
                                                      ),
                                                      // boxShadow: [
                                                      //   BoxShadow(
                                                      //     color: Colors.grey,
                                                      //     blurRadius: 5,
                                                      //     offset: Offset(0, 3), // Shadow offset
                                                      //   ),
                                                      // ],
                                                    ),
                                                    child: Row(
                                                      children: [
                                                        Stack(
                                                          children: [
                                                            CountryCodePicker(
                                                              onChanged:
                                                                  (CountryCode
                                                                      countryCode) {
                                                                logger.e(
                                                                    countryCode);
                                                                setState(() {
                                                                  loginMap[
                                                                          'dialCode'] =
                                                                      countryCode;
                                                                });
                                                              },
                                                              initialSelection:
                                                                  'IN',
                                                              hideMainText:
                                                                  true,
                                                              alignLeft: true,
                                                              padding:
                                                                  const EdgeInsets
                                                                      .symmetric(
                                                                      horizontal:
                                                                          0),
                                                            ),
                                                            Positioned(
                                                                bottom: 10,
                                                                right: 0,
                                                                child:
                                                                    Container(
                                                                  // color: Colors.amber,
                                                                  child: const Icon(
                                                                      Icons
                                                                          .arrow_drop_down),
                                                                ))
                                                          ],
                                                        )
                                                        // Icon(Icons.arrow_drop_down)
                                                      ],
                                                    ),
                                                  ),
                                                )),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      left: calculator
                                                          .calculateResponsiveWidth(
                                                              2)),
                                                  child: Container(
                                                    width: calculator
                                                        .calculateResponsiveWidth(
                                                            65),
                                                    height: calculator
                                                        .calculateResponsiveHeight(
                                                            6),
                                                    child: TextFormField(
                                                      validator: (value) {
                                                        formValidation(value);
                                                      },
                                                      controller:
                                                          phoneNumberController,
                                                      keyboardType:
                                                          TextInputType.phone,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),

                                                      decoration:
                                                          InputDecoration(
                                                        contentPadding:
                                                            EdgeInsets.only(
                                                                bottom: 12.0),
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        15.0))),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderSide: BorderSide(
                                                                color: Theme.of(
                                                                        context)
                                                                    .primaryColor),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .all(
                                                                    Radius.circular(
                                                                        15.0))),
                                                        floatingLabelStyle:
                                                            const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 15),
                                                        labelStyle:
                                                            const TextStyle(
                                                          color: Color(
                                                              0xffF5CBBF), // Set your desired text color
                                                          fontSize:
                                                              15.0, // Set your desired font size
                                                        ),
                                                        border: const OutlineInputBorder(
                                                            borderSide:
                                                                BorderSide(),
                                                            borderRadius:
                                                                BorderRadius.all(
                                                                    Radius.circular(
                                                                        15.0))),
                                                        prefixIcon: Container(
                                                          // color: Colors.green,
                                                          width: calculator
                                                              .calculateResponsiveWidth(
                                                                  5),
                                                          height: calculator
                                                              .calculateResponsiveHeight(
                                                                  6),
                                                          child: Align(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              loginMap[
                                                                      'dialCode']
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Theme.of(
                                                                          context)
                                                                      .primaryColor),
                                                            ),
                                                          ),
                                                        ),
                                                        suffixIcon: Visibility(
                                                          visible: loginMap[
                                                                  'isPhoneNumber'] !=
                                                              false,
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        50.0), // Set the desired border radius
                                                            child: Container(
                                                                // color: Colors.amber,
                                                                // width:
                                                                //     20.0, // Set the desired width
                                                                // height:
                                                                //     20.0, // Set the desired height
                                                                child:
                                                                    GestureDetector(
                                                              onTap: () {
                                                                // Handle the click action here
                                                                String
                                                                    phoneNumber =
                                                                    phoneNumberController
                                                                        .text;
                                                                phoneNumber = phoneNumber.substring(
                                                                    0,
                                                                    phoneNumberController
                                                                            .text
                                                                            .length -
                                                                        1);
                                                                logger.w(
                                                                    phoneNumber);
                                                                setState(() {
                                                                  phoneNumber =
                                                                      phoneNumber.substring(
                                                                          0,
                                                                          phoneNumberController.text.length -
                                                                              1);
                                                                });
                                                              },
                                                              child: Icon(
                                                                Icons.close,
                                                                color: Colors
                                                                    .black,
                                                                size: 15.0,
                                                                // Set the desired size for the icon
                                                              ),
                                                            )),
                                                          ),
                                                          // ),
                                                        ),
                                                        labelText: string
                                                                    .stringsMap[
                                                                'login'][
                                                            'loginPlaceHolder'],
                                                      ),
                                                      onChanged: (val) {
                                                        if (val != '') {
                                                          setState(() {
                                                            loginMap[
                                                                    'isPhoneNumber'] =
                                                                true;
                                                          });
                                                        }
                                                        logger.d(val);
                                                      },
                                                      // validator: (val) {
                                                      //   logger.e(val);
                                                      //   if (val!.isEmpty) {
                                                      //     return 'required';
                                                      //   } else {
                                                      //     return null;
                                                      //   }
                                                      // },
                                                    ),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Visibility(
                                                visible: loginMap['Error']
                                                        ['isError'] ==
                                                    true,
                                                child: Container(
                                                  width: 10,
                                                  height: 10,
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    child: ErrorMessage(
                                                      btnText: loginMap['Error']
                                                          ['errorMessage'],
                                                      padding: 2,
                                                    ),
                                                  ),
                                                ))
                                          ],
                                        )),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: calculator
                                              .calculateResponsiveHeight(1.5)),
                                      child: Button(
                                        borderColor:
                                            Theme.of(context).primaryColor,
                                        btnText:
                                            string.stringsMap['otpVerification']
                                                ['continue'],
                                        btnBgColor:
                                            Theme.of(context).primaryColor,
                                        btnTextColor: Theme.of(context)
                                            .secondaryHeaderColor,
                                        onNavigation: () {
                                          // logger.e(_selectedCountry);
                                          if (formkey.currentState!
                                              .validate()) {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      OtpVerificationScreen(
                                                        countryCode:
                                                            CountryCode,
                                                        phoneNumber:
                                                            loginMap['dialCode']
                                                                .toString(),
                                                      )),
                                            );
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
                ))));
  }
}
