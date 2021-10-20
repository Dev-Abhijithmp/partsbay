import 'package:flutter/material.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/authentication/loginpage.dart';
import 'package:partsbay/screens/bottombar.dart';

class Signinout extends StatefulWidget {
  const Signinout({Key? key}) : super(key: key);

  @override
  _SigninoutState createState() => _SigninoutState();
}

class _SigninoutState extends State<Signinout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: changesign,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("Something went wrong");
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(
                    value: 2,
                    semanticsLabel: "Loading...",
                    color: Color.fromRGBO(242, 50, 134, 1),
                  ),
                ),
              );
            } else if (snapshot.hasData) {
              return Bottompage();
            } else {
              return Loginpage();
            }
          }),
    );
  }
}
