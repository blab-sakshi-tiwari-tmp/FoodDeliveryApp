import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Screens/onboarding_screen.dart';
import 'package:food_delivery_app/UI/Utils/images.dart';
import 'package:food_delivery_app/UI/Utils/responsive_function.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  _navigateToOnboarding() async {
    await Future.delayed(
        const Duration(milliseconds: 3000),
        () => {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const OnBoardingScreen()))
            });
  }

  @override
  Widget build(BuildContext context) {
    ResponsiveCalculator calculator = ResponsiveCalculator(context);
    Images img = Images();
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Positioned(
            top: calculator.calculateResponsiveHeight(15.0),
            left: calculator.calculateResponsiveWidth(0),
            right: calculator.calculateResponsiveWidth(0),
            child: Expanded(
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: calculator.calculateResponsiveHeight(20.0),
                  width: calculator.calculateResponsiveWidth(100.0),
                  child: Image(
                    image: AssetImage(img.imagesMap['logo']),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      width: calculator.calculateResponsiveWidth(100.0),
                      child: Image(
                        image: AssetImage(img.imagesMap['splashBg']),
                      )))),
        ],
      ),
    ));
  }
}
