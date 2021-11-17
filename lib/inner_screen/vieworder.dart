import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';

class Vieworderuser extends StatelessWidget {
  const Vieworderuser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("view orders"),
        backgroundColor: green,
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance
            .collection('user')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('orders')
            .get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  List<String> ss = data[index].get('itemids');
                  return Container(
                    height: 400 * (ss.length).toDouble(),
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      itemCount: ss.length,
                      itemBuilder: (BuildContext context, int index2) {
                        return singleorderitem(data[index]);
                      },
                    ),
                  );
                });
          } else if (snapshot.hasError == true) {
            return SOmethingwentwrong();
          } else {
            return Loadingpage();
          }
        },
      ),
    );
  }
}

Widget singleorderitem(DocumentSnapshot _data) {
  return Container(
    height: 380,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: green),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('order id'), Text("-"), Text(_data['itemids'])],
        ),
      ],
    ),
  );
}
