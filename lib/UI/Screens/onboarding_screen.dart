import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/Screens/loginOrSignup_screen.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';
import 'package:food_delivery_app/UI/Utils/strings.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
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
              child: Stack(
                children: [
                  InkWell(
                    child: CarouselSlider(
                        items: carouselOnboardingList
                            .map((item) => SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Stack(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: calculator
                                                          .calculateResponsiveWidth(
                                                              5)),
                                                  child: Text(item['title'],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleLarge),
                                                ),
                                              ],
                                            ),
                                            Image(
                                                image: AssetImage(
                                                    item['image_path']),
                                                fit: BoxFit.cover,
                                                width: (MediaQuery.of(context)
                                                        .size
                                                        .width) +
                                                    200,
                                                height: (MediaQuery.of(context)
                                                        .size
                                                        .width) +
                                                    200),
                                            // )
                                          ],
                                        )
                                      ]),
                                ))
                            .toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: calculator.calculateResponsiveHeight(75),
                          aspectRatio: 2,
                          viewportFraction: 1,
                          autoPlay: true,
                          scrollPhysics: const BouncingScrollPhysics(),
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentCarouselIndex = index;
                            });
                          },
                        )),
                  ),
                  Positioned(
                      bottom: calculator.calculateResponsiveHeight(10),
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            carouselOnboardingList.asMap().entries.map((entry) {
                          return GestureDetector(
                            onTap: () => {
                              carouselController
                                  .animateToPage(currentCarouselIndex)
                            },
                            child: Container(
                              width: currentCarouselIndex == entry.key ? 10 : 7,
                              height:
                                  currentCarouselIndex == entry.key ? 10 : 7,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: currentCarouselIndex == entry.key
                                    ? const Color(0xffFE724C)
                                    : const Color(0xffFDA38A),
                              ),
                            ),
                          );
                        }).toList(),
                      ))
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
                      btnText: string.stringsMap['onBoarding']['next'],
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
                      btnText: string.stringsMap['onBoarding']['skip'],
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
