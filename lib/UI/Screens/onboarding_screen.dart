import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/ReusableWidgets/button.dart';
import 'package:food_delivery_app/UI/Screens/loginOrSignup.dart';
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
  String isFocused = 'Next';
  @override
  Widget build(BuildContext context) {
    Strings string = Strings();
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
    // List<Widget> indicators =
    logger.e(currentCarouselIndex);
    return Scaffold(
        body: SafeArea(
            child: Center(
                child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: calculator.calculateResponsiveWidth(0),
          vertical: calculator.calculateResponsiveHeight(0)),
      child: Container(
        // color: Colors.amber,
        height: calculator.calculateResponsiveHeight(90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              // color: Colors.red,
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
                                            // Align(
                                            //     alignment: Alignment.centerLeft,
                                            //     child: Visibility(
                                            //         visible: currentCarouselIndex == 0,
                                            //         child: Container(
                                            //           height: calculator
                                            //               .calculateResponsiveHeight(5),
                                            //           child: Image(
                                            //             image: AssetImage(
                                            //                 img.imagesMap['smily']),
                                            //           ),
                                            //         ))),
                                            // Positioned(
                                            // child:
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
                    child: SizedBox(
                      width: calculator.calculateResponsiveWidth(100),
                      height: calculator.calculateResponsiveHeight(5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: isFocused == 'Next'
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                          backgroundColor: isFocused == 'Next'
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                          padding: const EdgeInsets.all(5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor, // Set your desired border color here
                              width: 1.0, // Set the width of the border
                            ),
                          ),
                        ),
                        child: Text(
                          'Next',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        onPressed: () {
                          carouselController.nextPage(
                              duration: Duration(milliseconds: 10),
                              curve: Curves.easeInExpo);
                          setState(() {
                            isFocused = 'Next';
                            logger.w(currentCarouselIndex);
                            currentCarouselIndex = currentCarouselIndex >= 0 &&
                                    currentCarouselIndex < 2
                                ? currentCarouselIndex + 1
                                : 0;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: calculator.calculateResponsiveWidth(5),
                        vertical: calculator.calculateResponsiveHeight(1)),
                    child: SizedBox(
                      width: calculator.calculateResponsiveWidth(100),
                      height: calculator.calculateResponsiveHeight(5),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: isFocused == 'Skip'
                              ? Theme.of(context).secondaryHeaderColor
                              : Theme.of(context).primaryColor,
                          backgroundColor: isFocused == 'Skip'
                              ? Theme.of(context).primaryColor
                              : Theme.of(context).secondaryHeaderColor,
                          padding: const EdgeInsets.all(5.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                            side: BorderSide(
                              color: Theme.of(context)
                                  .primaryColor, // Set your desired border color here
                              width: 1.0, // Set the width of the border
                            ),
                          ),
                        ),
                        child: Text('Skip',
                            style: Theme.of(context).textTheme.titleMedium),
                        onPressed: () {
                          setState(() {
                            isFocused = 'Skip';
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const loginOrSignup()));
                        },
                      ),
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
