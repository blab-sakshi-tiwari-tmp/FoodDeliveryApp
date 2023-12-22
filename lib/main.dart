import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Screens/geo_location.dart';
import 'package:food_delivery_app/UI/Screens/loginOrSignup_screen.dart';
import 'package:food_delivery_app/UI/Screens/login_screen.dart';
import 'package:food_delivery_app/UI/Screens/onboarding_screen.dart';
import 'package:food_delivery_app/UI/Screens/otp_verification.dart';
import 'package:food_delivery_app/UI/Screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: const Color(0xffFE724C),
          secondaryHeaderColor: Colors.white,
          useMaterial3: true,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Roboto-Medium'),
            titleMedium: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Color(0xffFE724C),
                fontFamily: 'Roboto-Regular'),
            titleSmall: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontFamily: 'Roboto-Regular'),
          )),
      home: LoginScreen(),
    );
  }
}
