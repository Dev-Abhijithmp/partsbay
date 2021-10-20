import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

import 'package:partsbay/myicons_icons.dart';
import 'package:partsbay/screens/cart.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewAppbar1(context, "Profile"),
          sizedh(20),
          profiletile("Name", "Abhijith"),
          sizedh(10),
          profiletile("Email", "111abhiabhi@gmail.com"),
          sizedh(10),
          profiletile("Phone", "9497747142"),
          sizedh(30),
          Divider(
            height: 1,
            color: Colors.black,
          ),
          sizedh(30),
          TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.settings,
              color: pink,
            ),
            label: Text("Settings",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: pink,
                )),
          ),
          sizedh(10),
          TextButton.icon(
            onPressed: () {
              signout();
            },
            icon: Icon(
              Myicons.logout,
              color: pink,
            ),
            label: Text("Logout",
                style: GoogleFonts.lato(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: pink,
                )),
          )
        ],
      ),
    );
  }
}
