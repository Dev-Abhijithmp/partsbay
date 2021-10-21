import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Loadingpage extends StatelessWidget {
  const Loadingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: CircularProgressIndicator(
          value: 4,
          color: pink,
        ),
      ),
    );
  }
}
