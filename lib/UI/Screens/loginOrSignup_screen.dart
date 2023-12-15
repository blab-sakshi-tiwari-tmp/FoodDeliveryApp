import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/Screens/login_screen.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';

class loginOrSignupScreen extends StatelessWidget {
  const loginOrSignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Strings string = Strings();
    ResponsiveCalculator calculator = ResponsiveCalculator(context);
    Images img = Images();
    return Scaffold(
        body: SafeArea(
      child: Expanded(
        child: Stack(children: [
          Image(
              image: AssetImage(img.imagesMap['loginBg']),
              fit: BoxFit.fitWidth,
              width: calculator.calculateResponsiveWidth(100),
              height: calculator.calculateResponsiveHeight(100)),
          Positioned(
              top: calculator.calculateResponsiveHeight(22),
              left: 0,
              right: 0,
              child: Container(
                width: calculator.calculateResponsiveWidth(30),
                height: calculator.calculateResponsiveHeight(43),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      string.stringsMap['login']['loginHeading1'],
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Roboto-Medium'),
                    ),
                    Button(
                      borderColor: Theme.of(context).primaryColor,
                      btnText: string.stringsMap['login']['loginBtnContent'],
                      btnBgColor: Theme.of(context).primaryColor,
                      btnTextColor: Theme.of(context).secondaryHeaderColor,
                      onNavigation: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      btnBorderRadius: 30.0,
                      padding: 7.0,
                    ),
                  ],
                ),
              ))
        ]),
      ),
    ));
  }
}
