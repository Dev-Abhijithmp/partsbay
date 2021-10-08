import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  Viewpage({Key? key}) : super(key: key);

  @override
  _ViewpageState createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(80, 167, 194, 1),
            Color.fromRGBO(183, 248, 219, 1),
            Colors.white,
            Colors.white
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }
}
