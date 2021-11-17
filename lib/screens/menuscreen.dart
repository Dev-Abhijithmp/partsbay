import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/changenameaddress.dart';
import 'package:partsbay/inner_screen/vieworder.dart';
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
  bool isenabled = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    void toenable() {
      setState(() {
        isenabled = true;
      });
    }

    void todisable() {
      setState(() {
        isenabled = false;
      });
    }

    return Scaffold(
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            viewAppbar1(context, "Profile"),
            sizedh(20),
            profiletile("Name", data.get('name')),
            sizedh(10),
            profiletile("Email", data.get('email')),
            sizedh(10),
            profiletile("Phone", "9497947142"),
            sizedh(10),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              decoration: BoxDecoration(
                  border: Border.all(color: green),
                  borderRadius: BorderRadius.circular(25)),
              width: double.infinity,
              child: ListTile(
                title: Text(
                  "Address",
                  style: GoogleFonts.lato(
                      color: blue, fontWeight: FontWeight.bold, fontSize: 20),
                ),
                subtitle: Expanded(
                  child: Text(
                    data.get('address'),
                    style: GoogleFonts.lato(
                      color: blue,
                    ),
                  ),
                ),
              ),
            ),
            sizedh(30),
            Divider(
              height: 1,
              color: blue,
            ),
            sizedh(30),
            Row(
              children: [
                TextButton.icon(
                  onPressed: () {
                    toenable();
                  },
                  icon: Icon(
                    Icons.settings,
                    color: green,
                  ),
                  label: Text("Settings",
                      style: GoogleFonts.lato(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: blue,
                      )),
                ),
                isenabled
                    ? IconButton(
                        onPressed: () {
                          todisable();
                        },
                        icon: Icon(Icons.arrow_drop_up))
                    : IconButton(
                        onPressed: () {
                          toenable();
                        },
                        icon: Icon(Icons.arrow_drop_down),
                      ),
              ],
            ),
            isenabled
                ? TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Changenameaddress(
                          title: "Name",
                        );
                      }));
                    },
                    icon: Icon(
                      Icons.person,
                      color: green,
                    ),
                    label: Text("Change Name",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        )),
                  )
                : Container(),
            isenabled
                ? TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return Changenameaddress(
                          title: "Address",
                        );
                      }));
                    },
                    icon: Icon(
                      Icons.location_on_outlined,
                      color: green,
                    ),
                    label: Text("Change Address",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        )),
                  )
                : Container(),
            isenabled
                ? TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Vieworderuser()));
                    },
                    icon: Icon(
                      Icons.delivery_dining_outlined,
                      color: green,
                    ),
                    label: Text("View orders",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        )),
                  )
                : Container(),
            isenabled
                ? TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.lock,
                      color: green,
                    ),
                    label: Text("Change password",
                        style: GoogleFonts.lato(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: blue,
                        )),
                  )
                : Container(),
            sizedh(10),
            TextButton.icon(
              onPressed: () {
                signout();
              },
              icon: Icon(
                Myicons.logout,
                color: green,
              ),
              label: Text("Logout",
                  style: GoogleFonts.lato(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: blue,
                  )),
            ),
            sizedh(60),
          ],
        ),
      ),
    );
  }
}
