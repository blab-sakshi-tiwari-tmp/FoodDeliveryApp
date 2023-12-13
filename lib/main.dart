import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/Food_Delivery_Bloc/food_delivery_bloc.dart';
import 'package:food_delivery_app/UI/Layouts/layout_2.dart';
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
        home: BlocProvider(
          create: (context) =>
              FoodDeliveryBloc(), // Initialize your FoodDeliveryBloc here
          child: MainLayout(),
        ));
  }
}
