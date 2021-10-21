import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/viewpage.dart';
import 'package:partsbay/screens/cart.dart';
import 'package:partsbay/screens/menuscreem.dart';

CollectionReference prod = FirebaseFirestore.instance.collection('products');
CollectionReference usr = FirebaseFirestore.instance.collection('user');

class Catadata extends StatelessWidget {
  final String docdata;
  Catadata({Key? key, required this.docdata}) : super(key: key);

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

        return Loadingpage();
      },
    );
  }
}

class Searchdata extends StatelessWidget {
  final String str;
  const Searchdata({Key? key, required this.str}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Profilefetch extends StatelessWidget {
  late final String uid;
  Profilefetch({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(uid);
    return FutureBuilder<DocumentSnapshot>(
        future: usr.doc(uid).get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            return Scaffold(body: Center(child: Text("Someething went wrong")));
          }

          if (snapshot.connectionState == ConnectionState.done) {
            DocumentSnapshot data = snapshot.data!;

            if (snapshot.data!.exists == true) {
              return MenuScreen(data: data);
            } else {
              return Scaffold(
                  body: Center(child: Text("Someething went wrong")));
            }
          }

          return Loadingpage();
        });
  }
}

class Cartdatafetch extends StatelessWidget {
  late final String uid;
  Cartdatafetch({Key? key, required this.uid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .collection('cart')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container(child: Text("Something went wrong"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Loadingpage();
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            if (data.isNotEmpty == true) {
              return Cartscreen(
                data: data,
              );
            } else {
              return Container(child: Text("Something went wrong"));
            }
          } else {
            return Loadingpage();
          }
        });
  }
}
