import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/Food_Delivery_Bloc/food_delivery_bloc.dart';
import 'package:food_delivery_app/UI/Bar/custom_app_bar.dart';
import 'package:food_delivery_app/UI/TestingWidgets/test1.dart';
import 'package:food_delivery_app/UI/TestingWidgets/test2.dart';
import 'package:food_delivery_app/UI/Bar/bottom_bar.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class MainLayout extends StatefulWidget {
  const MainLayout({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MainLayoutState();
}

class MainLayoutState extends State<MainLayout> {
  dynamic screen = [];

  dynamic wid = 1;
  @override
  Widget build(BuildContext context) {
    screen = [
      const Test1(),
      const Test2(),
    ];
    logger.e('layout loaded');
    return Scaffold(
        appBar: CustomAppBar(),
        body: CustomSingleChildLayout(
          delegate: MyCustomLayoutDelegate(),
          child: BlocBuilder<FoodDeliveryBloc, FoodDeliveryBlocState>(
            builder: (context, state) {
              // Access the global state here
              int globalValue = state.value;

              return Stack(
                children: [
                  screen[globalValue],
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Container(
                            height: 50,
                            width: 50,
                            color: Colors.green,
                            child: Text(globalValue.toString())),
                      )),
                ],
              );
            },
          ),
        ),
        bottomNavigationBar: BottomBar());
  }
}

class MyCustomLayoutDelegate extends SingleChildLayoutDelegate {
  @override
  BoxConstraints getConstraintsForChild(BoxConstraints constraints) {
    return const BoxConstraints(
        minWidth: 0.0, maxWidth: 500, minHeight: 0.0, maxHeight: 1000);
  }

  @override
  Offset getPositionForChild(Size size, Size childSize) {
    return const Offset(0, 0);
  }

  @override
  bool shouldRelayout(covariant SingleChildLayoutDelegate oldDelegate) {
    return false;
  }
}
