import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/authentication/authenticate.dart';

import '../colorsandfontsandwidgets.dart';

class Adminmenu extends StatefulWidget {
  const Adminmenu({Key? key}) : super(key: key);

  @override
  _AdminmenuState createState() => _AdminmenuState();
}

class _AdminmenuState extends State<Adminmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            sizedh(20),
            profiletile("Name", "Abhijith"),
            sizedh(10),
            profiletile("Email", "111abhiabhi@gmail.com"),
            sizedh(10),
            Divider(
              color: blue,
            ),
            Center(
              child: Text(
                "Actions",
                style: GoogleFonts.lato(fontSize: 20),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text("Add products",
                        style: GoogleFonts.lato(fontSize: 20, color: white))),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text("Remove products",
                        style: GoogleFonts.lato(fontSize: 20, color: white))),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text("Update products",
                        style: GoogleFonts.lato(fontSize: 20, color: white))),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                child: Center(
                    child: Text("Genarate reports",
                        style: GoogleFonts.lato(fontSize: 20, color: white))),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                signout();
              },
              child: Container(
                child: Center(
                    child: Text("Logout ",
                        style: GoogleFonts.lato(fontSize: 20, color: white))),
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blue,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
