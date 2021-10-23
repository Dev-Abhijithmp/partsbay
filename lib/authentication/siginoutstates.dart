import 'package:flutter/material.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/authentication/loginpage.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';
import 'package:partsbay/wrapper.dart';

class Signinout extends StatefulWidget {
  const Signinout({Key? key}) : super(key: key);

  @override
  _SigninoutState createState() => _SigninoutState();
}

class _SigninoutState extends State<Signinout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blue,
      body: StreamBuilder(
          stream: changesign,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return SOmethingwentwrong();
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Loadingpage();
            } else if (snapshot.hasData) {
              return Wrapper();
            } else {
              return Loginpage();
            }
          }),
    );
  }
}
