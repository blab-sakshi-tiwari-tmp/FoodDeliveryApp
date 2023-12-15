import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/Screens/loginOrSignup_screen.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';

class GeoLocationScreen extends StatefulWidget {
  const GeoLocationScreen({Key? key}) : super(key: key);

  @override
  State<GeoLocationScreen> createState() => GeoLocationState();
}

class GeoLocationState extends State<GeoLocationScreen> {
  final CarouselController carouselController = CarouselController();
  int currentCarouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    Strings string = Strings();
    String isFocused = string.stringsMap['onBoarding']['next'];
    Images img = Images();
    List carouselOnboardingList = [
      {
        "image_id": 1,
        "image_path": img.imagesMap['burgerBg'],
        "title": string.stringsMap['onBoarding']['onBoardingHeading1']
      },
      {
        "image_id": 2,
        "image_path": img.imagesMap['deliveryBoy'],
        "title": string.stringsMap['onBoarding']['onBoardingHeading2']
      },
      {
        "image_id": 3,
        "image_path": img.imagesMap['phone'],
        "title": string.stringsMap['onBoarding']['onBoardingHeading3']
      },
    ];
    ResponsiveCalculator calculator = ResponsiveCalculator(context);

    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: calculator.calculateResponsiveWidth(0),
          vertical: calculator.calculateResponsiveHeight(0)),
      child: Container(
        height: calculator.calculateResponsiveHeight(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Column(
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
                  // Image(
                  //     image: AssetImage(img.imagesMap['gps']),
                  //     fit: BoxFit.fitWidth,
                  //     width: calculator.calculateResponsiveWidth(100),
                  //     height: calculator.calculateResponsiveHeight(100)),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: calculator.calculateResponsiveWidth(5),
                        vertical: calculator.calculateResponsiveHeight(1)),
                    child: Button(
                      borderColor:
                          isFocused == string.stringsMap['onBoarding']['skip']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      btnText: string.stringsMap['GPS']['locationBtnHeading'],
                      btnBgColor:
                          isFocused == string.stringsMap['onBoarding']['next']
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                      btnTextColor:
                          isFocused == string.stringsMap['onBoarding']['next']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      onNavigation: () {
                        carouselController.nextPage(
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.easeInExpo);
                        setState(() {
                          isFocused = string.stringsMap['onBoarding']['next'];
                          logger.w(currentCarouselIndex);
                          currentCarouselIndex = currentCarouselIndex >= 0 &&
                                  currentCarouselIndex < 2
                              ? currentCarouselIndex + 1
                              : 0;
                        });
                      },
                      btnBorderRadius: 30.0,
                      padding: 7.0,
                      width: 100,
                    ),
                  ),
                  Text(
                    string.stringsMap['GPS']['locationDescription'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Roboto-Medium'),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: calculator.calculateResponsiveWidth(5),
                        vertical: calculator.calculateResponsiveHeight(1)),
                    child: Button(
                      borderColor:
                          isFocused == string.stringsMap['onBoarding']['skip']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      btnText: string.stringsMap['GPS']['allow'],
                      btnBgColor:
                          isFocused == string.stringsMap['onBoarding']['next']
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                      btnTextColor:
                          isFocused == string.stringsMap['onBoarding']['next']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      onNavigation: () {
                        carouselController.nextPage(
                            duration: const Duration(milliseconds: 10),
                            curve: Curves.easeInExpo);
                        setState(() {
                          isFocused = string.stringsMap['onBoarding']['next'];
                          logger.w(currentCarouselIndex);
                          currentCarouselIndex = currentCarouselIndex >= 0 &&
                                  currentCarouselIndex < 2
                              ? currentCarouselIndex + 1
                              : 0;
                        });
                      },
                      btnBorderRadius: 30.0,
                      padding: 7.0,
                      width: 100,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: calculator.calculateResponsiveWidth(5),
                        vertical: calculator.calculateResponsiveHeight(1)),
                    child: Button(
                      borderColor:
                          isFocused == string.stringsMap['onBoarding']['skip']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      btnText: string.stringsMap['GPS']['skip'],
                      btnBgColor:
                          isFocused == string.stringsMap['onBoarding']['skip']
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                      btnTextColor:
                          isFocused == string.stringsMap['onBoarding']['skip']
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                      onNavigation: () {
                        setState(() {
                          isFocused = string.stringsMap['onBoarding']['skip'];
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const loginOrSignupScreen()));
                      },
                      btnBorderRadius: 30.0,
                      padding: 7.0,
                      width: 100,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ))));
  }
}
