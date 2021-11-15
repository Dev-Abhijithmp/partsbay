import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/admin/adminmenu.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';
import 'package:partsbay/screens/bottombar.dart';

class Userswitcher extends StatelessWidget {
  const Userswitcher({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return FutureBuilder<DocumentSnapshot>(
      future: FirebaseFirestore.instance.collection("user").doc(uid).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError == true) {
          return SOmethingwentwrong();
        } else if (snapshot.hasData == true) {
          DocumentSnapshot data = snapshot.data;
          if (data["role"] == "admin") {
            return Adminmenu();
          } else {
            return Bottompage();
          }
        } else {
          return Loadingpage();
        }
      },
    );
  }
}
