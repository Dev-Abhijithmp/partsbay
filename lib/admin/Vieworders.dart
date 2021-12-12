import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Vieworders extends StatelessWidget {
  const Vieworders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text("View all orders"),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('orders').get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Container();
        },
      ),
    );
  }
}
