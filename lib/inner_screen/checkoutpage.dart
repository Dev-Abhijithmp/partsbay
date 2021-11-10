import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/inner_screen/ordersucces.dart';

class Checkoutpage extends StatelessWidget {
  const Checkoutpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            viewAppbar1(context, "Checkout"),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height - 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Ordersucces()));
                    },
                    child: Container(
                      width: double.infinity,
                      height: 70,
                      margin:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      child: Center(
                        child: Text(
                          "COD",
                          style: GoogleFonts.lato(
                              color: blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 25),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: green)),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    child: Center(
                      child: Text(
                        "CREDIT/DEBIT Cards",
                        style: GoogleFonts.lato(
                            color: blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 25),
                      ),
                    ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: green)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
