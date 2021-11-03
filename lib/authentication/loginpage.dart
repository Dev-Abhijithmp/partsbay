import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/authentication/forgot.dart';
import 'package:partsbay/authentication/signuppage.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Loginpage extends StatefulWidget {
  Loginpage({Key? key}) : super(key: key);

  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    TextEditingController controllerMail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: blue,
      body: Container(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    green,
                    Color.fromRGBO(28, 6, 59, 1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            CustomPaint(
              painter: BoxShadowpainter(),
              willChange: true,
              foregroundPainter: BoxShadowpainter(),
              child: Container(),
            ),
            ClipPath(
              clipper: SClipper(),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [green, blue],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "E-MAIL ADDRESS",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: controllerMail,
                            decoration: InputDecoration(
                              focusedBorder: outbid(),
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.email,
                                color: blue,
                              ),
                              border: outbid(),
                              enabledBorder: outbid(),
                              disabledBorder: outbid(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PASSWORD",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 50,
                          child: TextFormField(
                            controller: controllerPass,
                            obscureText: true,
                            decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(
                                Icons.lock,
                                color: green,
                              ),
                              border: outbid(),
                              enabledBorder: outbid(),
                              disabledBorder: outbid(),
                              focusedBorder: outbid(),
                              enabled: true,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Material(
                        color: Colors.red,
                        shadowColor: Colors.black,
                        borderRadius: BorderRadius.circular(20),
                        child: InkWell(
                          onTap: () {
                            signinemail(
                                controllerMail.text, controllerPass.text);
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            child: Text(
                              "login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return Forgotpass();
                          }));
                        },
                        child: Text(
                          "FORGOTTEN PASSWORD?",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 10),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 25,
              child: Text(
                "Login",
                style: TextStyle(
                  color: blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              bottom: 40,
              left: 105,
              child: TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Signuppage();
                  }));
                },
                child: Text(
                  "CREATE A NEW ACCOUNT",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BoxShadowpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();

    path.moveTo(0, size.height * 0.47);
    path.quadraticBezierTo(size.width * 0.7, size.height * 0.4, size.width, 0);

    path.lineTo(size.width, size.height * 0.455);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.60, 0, size.height * 0.99);
    path.lineTo(0, size.height * 0.5);
    path.close();

    canvas.drawShadow(path, Colors.black.withOpacity(0.15), 6, false);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class SClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.5);
    path.quadraticBezierTo(
        size.width * 0.7, size.height * 0.4, size.width, size.height * 0.04);

    path.lineTo(size.width, size.height * 0.45);
    path.quadraticBezierTo(
        size.width * 0.3, size.height * 0.60, 0, size.height * 0.96);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

OutlineInputBorder outbid() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.none,
      ));
}
