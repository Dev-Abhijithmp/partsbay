import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/authentication/authenticate.dart';

import 'package:partsbay/myicons_icons.dart';

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
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromRGBO(28, 6, 59, 1),
              Colors.white,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "profile",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(242, 50, 134, 1),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("purchase history",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(242, 50, 134, 1),
                )),
            SizedBox(
              height: 30,
            ),
            Text("Settings",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(242, 50, 134, 1),
                )),
            SizedBox(
              height: 30,
            ),
            Text("Invite Friends",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(242, 50, 134, 1),
                )),
            SizedBox(
              height: 30,
            ),
            Text("Switch Account",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color.fromRGBO(242, 50, 134, 1),
                )),
            SizedBox(
              height: 30,
            ),
            Divider(
              height: 1,
              color: Colors.black,
            ),
            SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: () {
                signout();
              },
              icon: Icon(
                Myicons.logout,
                color: Color.fromRGBO(242, 50, 134, 1),
              ),
              label: Text("Logout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(242, 50, 134, 1),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
