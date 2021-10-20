import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfonts.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    bool cartlfag = true;
    if (cartlfag == true) {
      return nonemptycart(context);
    } else {
      return emptycart(context);
    }
  }
}

//the  function emptycart contain ui data of emty cart page
Widget emptycart(context) {
  return SafeArea(
    child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(80, 167, 194, 1),
            Color.fromRGBO(183, 248, 219, 1),
            Colors.white,
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                "Your cart is empty",
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Contine Shopping"))
          ],
        ),
      ),
    ),
  );
}

//the function non empty cart contain data of cart page that contain items
Widget nonemptycart(context) {
  return Scaffold(
    body: Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          viewAppbar(context),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return singlecartitem(context);
              },
              itemCount: 1,
            ),
          ),
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(color: Colors.white, boxShadow: [
              BoxShadow(offset: Offset(0, 0), spreadRadius: 1, blurRadius: 1),
            ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Material(
                  child: InkWell(
                    onTap: () {},
                    splashColor: Colors.blue,
                    child: Container(
                      child: Center(
                        child: Text("checkout",
                            style: TextStyle(color: Colors.white)),
                      ),
                      width: 150,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(28, 6, 59, 1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Grand total = 200",
                  style: TextStyle(),
                )
              ],
            ),
          ),
          SizedBox(height: 56)
        ],
      ),
    ),
  );
}

Widget viewAppbar(context) {
  return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blue,
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black54,
              offset: Offset(0, 1))
        ],
      ),
      child: Center(
        child: Text(
          "My Cart",
          style: GoogleFonts.lato(
              fontSize: 30, color: pink, fontWeight: FontWeight.bold),
        ),
      ));
}

Widget singlecartitem(context) {
  return Card(
    margin: EdgeInsets.all(10),
    child: Container(
      decoration:
          BoxDecoration(border: Border.all(color: Colors.grey, width: 1)),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                child: Image.asset(
                  "images/duke390.jpeg",
                  fit: BoxFit.contain,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name'),
                  Text("Description"),
                  Text("price"),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                    child: Text("add to wishlist"),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1)),
                  child: Center(
                    child: Text("Remove"),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
