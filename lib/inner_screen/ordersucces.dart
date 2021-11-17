import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Ordersucces extends StatelessWidget {
  late final int totalamount;
  Ordersucces({Key? key, required this.totalamount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        color: green,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle,
              size: 80,
              color: Colors.green.shade700,
            ),
            sizedh(15),
            Text(
              "₹" + totalamount.toString(),
              style: GoogleFonts.lato(color: white, fontSize: 40),
            ),
            sizedh(10),
            Text(
              "your order has been placed successfully",
              style: GoogleFonts.lato(color: white, fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
