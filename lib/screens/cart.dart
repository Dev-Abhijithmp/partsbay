import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

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
          viewAppbar1(context, "My Cart"),
          Expanded(
            child: ListView.builder(
              itemBuilder: (BuildContext context, index) {
                return singlecartitem(context);
              },
              itemCount: 10,
            ),
          ),
          InkWell(
            onTap: () {},
            splashColor: Colors.blue.shade100,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Center(
                child: Text("CHECKOUT(₹200)", style: TextStyle(color: pink)),
              ),
              width: 200,
              height: 40,
              decoration: BoxDecoration(
                color: blue,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          SizedBox(height: 60)
        ],
      ),
    ),
  );
}

Widget viewAppbar1(context, String title) {
  return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: blue,
        boxShadow: [
          BoxShadow(
              blurRadius: 1,
              spreadRadius: 1,
              color: Colors.black26,
              offset: Offset(0, 1))
        ],
      ),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.lato(
              fontSize: 30, color: pink, fontWeight: FontWeight.bold),
        ),
      ));
}

Widget singlecartitem(context) {
  return Card(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 120,
              height: 130,
              child: Image.asset(
                "images/duke390.jpeg",
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name'),
                Text("Description"),
                Text("price"),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.exposure_minus_1_sharp,
                        color: pink,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text("1"),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.add,
                        color: pink,
                      ),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          border: Border.all(color: blue),
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.delete,
                        color: pink,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    ),
  );
}
