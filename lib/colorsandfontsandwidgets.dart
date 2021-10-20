// ignore_for_file: implementation_imports

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color pink = Color.fromRGBO(242, 50, 134, 1);
Color blue = Color.fromRGBO(28, 6, 59, 1);
Color greybackground = Colors.grey.shade200;

Widget sizedh(double value) {
  return SizedBox(
    height: value,
  );
}

Widget sizedw(double value) {
  return SizedBox(
    width: value,
  );
}

Widget profiletile(String title, String subtitle) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 5),
    child: Card(
      child: ListTile(
        title: Text(
          title,
          style: GoogleFonts.lato(
              color: blue, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        subtitle: Text(
          subtitle,
          style: GoogleFonts.lato(
            color: blue,
          ),
        ),
      ),
    ),
  );
}
