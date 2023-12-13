import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/Food_Delivery_Bloc/food_delivery_bloc.dart';
import 'package:food_delivery_app/UI/TestingWidgets/test1.dart';
import 'package:food_delivery_app/UI/TestingWidgets/test2.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class BottomBar extends StatefulWidget {
  // const BottomBar({required this.indexChanged});
  // final Function(dynamic) indexChanged;

  const BottomBar({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => BottomBarState();
}

class BottomBarState extends State<BottomBar> {
  dynamic list;
  // final Function(dynamic) indexChanged;
  Map<int, String> screen1 = {
    // 0: 'Setting1',
    0: 'test1',
    1: 'test2',
  };

  dynamic screen = [];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final foodDeliveryBloc = BlocProvider.of<FoodDeliveryBloc>(context);

    // logger.e(_selectedIndex);
    // Map<String, dynamic> jsonData = json.decode(list);
    screen = [
      // Setting1(jsonData),
      const Test1(),
      const Test2(),
    ];
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), label: 'test1'),
        BottomNavigationBarItem(icon: Icon(Icons.rule), label: 'test2'),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.amber[800],
      onTap: (int index) {
        if (index != _selectedIndex) {
          // indexChanged(_selectedIndex);
          foodDeliveryBloc.add(FoodDeliveryIndexChangedEvent(index));
        }
        setState(() {
          _selectedIndex = index;
        });
      },
    );
  }
}
