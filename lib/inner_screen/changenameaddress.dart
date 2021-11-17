import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/fetchdata/firestore.dart';

class Changenameaddress extends StatelessWidget {
  late final String title;
  Changenameaddress({Key? key, required this.title}) : super(key: key);
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            viewAppbar1(context, "Change $title"),
            sizedh(120),
            Row(
              children: [
                sizedw(20),
                Text(
                  title,
                  style: GoogleFonts.lato(fontSize: 20, color: blue),
                )
              ],
            ),
            sizedh(10),
            Container(
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: outbid1(),
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(
                    Icons.person,
                    color: green,
                  ),
                  border: outbid1(),
                  enabledBorder: outbid1(),
                  disabledBorder: outbid1(),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () async {
                if (controller.text == "") {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: Text('error'),
                            content: Text('fill the field'),
                            actions: [
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("ok"))
                            ],
                          ));
                } else {
                  Map<String, String?> flag;
                  if (title == "Name") {
                    flag = await addnametodatabase(
                        FirebaseAuth.instance.currentUser!.uid,
                        controller.text);
                    Navigator.pop(context);
                  } else {
                    flag = await changeaddress(
                        FirebaseAuth.instance.currentUser!.uid,
                        controller.text);
                    Navigator.pop(context);
                  }
                  if (flag['status'] == "success") {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('success'),
                              content: Text('success'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok"))
                              ],
                            ));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('error'),
                              content: Text(flag['status']!),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok"))
                              ],
                            ));
                  }
                }
              },
              child: Container(
                height: 40,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: green,
                ),
                child: Center(
                  child: Text(
                    "Change",
                    style: GoogleFonts.lato(color: white, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

OutlineInputBorder outbid1() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(17),
      borderSide: BorderSide(color: green));
}
