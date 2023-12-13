import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class Test2 extends StatelessWidget {
  const Test2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // logger.e('hello');
    return Scaffold(
        // appBar: AppBar(
        //   title: const Center(
        //     child: Text('Setting2'),
        //   ),
        // ),
        body: Container(
      color: Colors.green,
      height: 100.0,
      child: Text('Test2'),
    ));
  }
}
