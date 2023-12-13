import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var logger = Logger();

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    logger.w('hddddddd');
    return AppBar(
      title: Text('Custom Header'),
      backgroundColor: Colors.blue,
      elevation: 4.0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 50.0);
}
