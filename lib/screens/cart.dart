import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Cartscreen extends StatefulWidget {
  late final List<DocumentSnapshot> data;
  Cartscreen({Key? key, required this.data}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState(data: data);
}

class _CartscreenState extends State<Cartscreen> {
  _CartscreenState({required this.data});
  late final List<DocumentSnapshot> data;
  @override
  Widget build(BuildContext context) {
    print(data.length);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    print(data.length);

    if (data.length > 0) {
      return nonemptycart(context, data);
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
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Contine Shopping"))
          ],
        ),
      ),
    ),
  );
}

//the function non empty cart contain data of cart page that contain items
Widget nonemptycart(context, List<DocumentSnapshot> data) {
  return Scaffold(
    body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        viewAppbar1(context, "My Cart"),
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                SizedBox(
                  height: 170 * (data.length).toDouble(),
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, index) {
                      return singlecartitem(
                        context,
                        data[index].get('url'),
                        data[index].get('title'),
                        data[index].get('price').toDouble(),
                        data[index].get('description'),
                        data[index].get('count'),
                        data[index].get('size'),
                        data[index].get('id'),
                      );
                    },
                    itemCount: data.length,
                  ),
                ),
              ],
            ),
          ),
        ),
        checkoutbutton(),
        sizedh(30)
      ],
    ),
  );
}
