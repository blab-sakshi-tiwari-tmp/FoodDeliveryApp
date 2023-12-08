import 'package:flutter/material.dart';
import 'package:food_delivery_app/UI/Screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Delivery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xffFE724C),
              // Set your desired background color here
              background: Colors.white),
          useMaterial3: true,
          textTheme: const TextTheme(
            titleLarge: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: Colors.black,
                fontFamily: 'Roboto-Medium'),
            titleMedium: TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.w500,
                color: const Color(0xffFE724C),
                fontFamily: 'Roboto-Regular'),
          )),
      home: const Splash(title: 'Food delivery app'),
    );
  }
}
