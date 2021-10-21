// ignore_for_file: implementation_imports

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/add_data/add_user.dart';

Color pink = Color.fromRGBO(242, 50, 134, 1);
Color blue = Color.fromRGBO(28, 6, 59, 1);
Color greybackground = Colors.grey.shade200;
Color white = Colors.white;

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

Widget checkoutbutton() {
  return InkWell(
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

Widget singlecartitem(context, String url, String title, double price,
    String description, int count, String size, int id) {
  return Card(
    margin: EdgeInsets.all(10),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              width: 120,
              height: 130,
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
                Text(title),
                Text(description),
                Text("₹" + price.toString()),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.exposure_minus_1_sharp,
                          color: pink,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      count.toString(),
                      style: GoogleFonts.lato(fontSize: 20, color: blue),
                    ),
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
                        width: 25,
                        height: 25,
                        decoration: BoxDecoration(
                            border: Border.all(color: blue),
                            borderRadius: BorderRadius.circular(10)),
                        child: Icon(
                          Icons.add,
                          color: pink,
                        ),
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
