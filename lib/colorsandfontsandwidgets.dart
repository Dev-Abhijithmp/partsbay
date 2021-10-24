// ignore_for_file: implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/add_data/add_user.dart';
import 'package:partsbay/fetchdata/firestore.dart';

Color pink = Color.fromRGBO(242, 50, 134, 1);
Color blue = Color.fromRGBO(28, 6, 59, 1);
Color green = Color.fromRGBO(147, 217, 163, 1);
Color greybackground = Colors.grey.shade300;
Color white = Colors.white;
Color bgcolor = Colors.white54;
AlertDialog alert(BuildContext context) {
  AlertDialog alertDialog = AlertDialog(
    content: Text("Please select size"),
    actions: [
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text("ok"),
      ),
    ],
  );
  return alertDialog;
}

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

Widget checkoutbutton(double total) {
  return InkWell(
    onTap: () {},
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Center(
        child: Text("CHECKOUT(₹$total)", style: TextStyle(color: blue)),
      ),
      width: 200,
      height: 40,
      decoration: BoxDecoration(
        color: green,
        borderRadius: BorderRadius.circular(20),
      ),
    ),
  );
}

Widget viewAppbar1(context, String title) {
  return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        color: green,
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
              fontSize: 30, color: blue, fontWeight: FontWeight.bold),
        ),
      ));
}

Widget singlecartitem(context, String url, String title, double price,
    String description, String size, String id, int count) {
  return SizedBox(
    width: MediaQuery.of(context).size.height * 0.9,
    child: Container(
      height: 120,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(40),
          border: Border.all(color: green)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 80,
                child: Image.network(
                  url,
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
                  Text(title.toUpperCase(),
                      style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: blue)),
                  Text(
                    description,
                    style: GoogleFonts.lato(fontSize: 12, color: blue),
                  ),
                  sizedh(5),
                  Text("₹" + price.toString(),
                      style: GoogleFonts.lato(fontSize: 15, color: blue)),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          subtractcount(FirebaseAuth.instance.currentUser!.uid,
                              id, price);
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              border: Border.all(color: blue),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.exposure_minus_1_sharp,
                            color: green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                          width: 28,
                          height: 28,
                          child: Center(child: cartcount(id))),
                      SizedBox(
                        width: 15,
                      ),
                      InkWell(
                        onTap: () {
                          addtocart(
                              context,
                              FirebaseAuth.instance.currentUser!.uid,
                              id,
                              url,
                              price,
                              description,
                              title,
                              size);
                        },
                        child: Container(
                          width: 28,
                          height: 28,
                          decoration: BoxDecoration(
                              border: Border.all(color: blue),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.add,
                            color: green,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      InkWell(
                        onTap: () {
                          removefromcart(
                              FirebaseAuth.instance.currentUser!.uid, id);
                        },
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              border: Border.all(color: blue),
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(
                            Icons.delete,
                            color: green,
                          ),
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
    ),
  );
}

Widget singlewhishlistitem(context, String url, String title, double price,
    String description, String id) {
  return Container(
    height: 300,
    width: MediaQuery.of(context).size.width * 0.49,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: green)),
    child: Column(
      children: [
        Image.network(
          url,
          width: 100,
          height: 130,
          fit: BoxFit.contain,
        ),
        SizedBox(
          width: 10,
        ),
        Text(title),
        Text(description),
        Text("₹" + price.toString()),
        SizedBox(
          height: 20,
        ),
        InkWell(
          child: Container(
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
        ),
      ],
    ),
  );
}
