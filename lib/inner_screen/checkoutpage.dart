import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Checkoutpage extends StatelessWidget {
  const Checkoutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [viewAppbar1(context, "Checkout"), Container()],
        ),
      ),
    );
  }
}
