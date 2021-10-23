import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/myicons_icons.dart';

class MenuScreen extends StatefulWidget {
  late final DocumentSnapshot data;
  MenuScreen({Key? key, required this.data}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState(data: data);
}

class _MenuScreenState extends State<MenuScreen> {
  DocumentSnapshot data;

  _MenuScreenState({required this.data});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return Scaffold(
      backgroundColor: bgcolor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          viewAppbar1(context, "Profile"),
          sizedh(20),
          profiletile("Name", data.get('name')),
          sizedh(10),
          profiletile("Email", data.get('email')),
          sizedh(10),
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
