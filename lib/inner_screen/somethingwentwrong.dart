import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class SOmethingwentwrong extends StatelessWidget {
  const SOmethingwentwrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Text("Something went wrong",
            style: GoogleFonts.lato(color: pink, fontSize: 20)),
      ),
    );
  }
}
