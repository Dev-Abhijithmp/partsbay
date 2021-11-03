import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/authentication/authenticate.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';

class Signuppage extends StatefulWidget {
  Signuppage({Key? key}) : super(key: key);

  @override
  _SignuppageState createState() => _SignuppageState();
}

class _SignuppageState extends State<Signuppage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light));
    TextEditingController controllerMail = TextEditingController();
    TextEditingController controllerPass = TextEditingController();
    TextEditingController controllerPass1 = TextEditingController();

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 6, 59, 1),
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
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "VERIFY PASSWORD",
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
                            controller: controllerPass1,
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
                  Material(
                    color: Colors.red,
                    shadowColor: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    child: InkWell(
                      onTap: () async {
                        register(controllerMail.text, controllerPass.text);
                        Navigator.canPop(context)
                            ? Navigator.pop(context)
                            : Loadingpage();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 10),
                        child: Text(
                          "Register",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: 40,
              right: 25,
              child: Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
            ),
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
