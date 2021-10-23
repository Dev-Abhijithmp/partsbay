import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loadingpage extends StatelessWidget {
  const Loadingpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.2,
          child: LoadingIndicator(
            indicatorType: Indicator.ballTrianglePathColored,
            strokeWidth: 4,
            colors: [Colors.orange, pink, blue],
          ),
        ),
      ),
    );
  }
}
