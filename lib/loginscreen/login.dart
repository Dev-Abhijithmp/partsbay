import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/loginscreen/otpscreen.dart';
import 'package:partsbay/my_flutter_app_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Loginscreen extends StatefulWidget {
  Loginscreen({Key? key}) : super(key: key);

  @override
  _LoginscreenState createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light),
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("images/bb.jpg"),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Row(
              children: [
                SizedBox(
                  width: 13,
                ),
                Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 35),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 70,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                cursorColor: Colors.black,
                maxLength: 10,
                maxLines: 1,
                textInputAction: TextInputAction.done,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                cursorHeight: 25,
                decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone,
                    color: Colors.black,
                  ),
                  prefixText: "+91",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white, width: 2),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black, width: 2),
                  ),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => OtpScreen()));
                },
                child: Text(
                  'Get OTP',
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  alignment: Alignment.center,
                  side: MaterialStateProperty.resolveWith(
                      (states) => BorderSide.none),
                  backgroundColor: MaterialStateProperty.resolveWith(
                    (states) => Colors.blue.shade700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Center(
              child: Text(
                "Or sign in with",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MyFlutterApp.facebook_circled,
                    color: Colors.blue.shade900,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    MyFlutterApp.twitter,
                    color: Colors.blue.shade500,
                    size: 40,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                IconButton(
                  enableFeedback: true,
                  onPressed: () {},
                  icon: SvgPicture.asset(
                    "icons/glogo.svg",
                    height: 40,
                    width: 40,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
