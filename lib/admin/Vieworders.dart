import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Vieworders extends StatelessWidget {
  const Vieworders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("View all orders"),
      ),
    );
  }
}
