import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partsbay/inner_screen/viewpage.dart';

CollectionReference prod = FirebaseFirestore.instance.collection('products');

class Catadata extends StatefulWidget {
  final String docdata;
  Catadata({Key? key, required this.docdata}) : super(key: key);

  @override
  _CatadataState createState() => _CatadataState(docdata);
}

class _CatadataState extends State<Catadata> {
  final String docdata;

  _CatadataState(this.docdata);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: prod.where('category', isEqualTo: docdata).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<DocumentSnapshot> data = snapshot.data!.docs;
          if (data.isEmpty) {
            return Scaffold(body: Text("Someething went wrong"));
          }
          print(data.length);
          print(data[0].get('price').toString());

          return Viewpage(
            data: data,
          );
        }

        return Scaffold(body: Text("loading"));
      },
    );
  }
}
