import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/admin/Vieworders.dart';
import 'package:partsbay/admin/Viewproducts.dart';
import 'package:partsbay/admin/addproducts.dart';
import 'package:partsbay/admin/removeproducts.dart';
import 'package:partsbay/admin/updateitems.dart';
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
        actions: [
          TextButton.icon(
            onPressed: () {
              signout();
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.white,
            ),
            label: Text(
              "SignOut",
              style: GoogleFonts.lato(color: white),
            ),
          ),
        ],
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Addproducts()));
              },
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Removeproducts()));
              },
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Updateitems()));
              },
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
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Viewproducts()));
              },
              child: Container(
                child: Center(
                    child: Text("View products",
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
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) => Vieworders()));
              },
              child: Container(
                child: Center(
                    child: Text("View Orders",
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
          ],
        ),
      ),
    );
  }
}
