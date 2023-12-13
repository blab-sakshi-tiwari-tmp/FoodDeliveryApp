import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Test1 extends StatelessWidget {
  const Test1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.green,
      height: 100.0,
      child: Text('Test1'),
    ));
  }
}
