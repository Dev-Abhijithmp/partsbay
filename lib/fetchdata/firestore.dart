// ignore_for_file: close_sinks

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/viewpage.dart';
import 'package:partsbay/screens/cart.dart';
import 'package:partsbay/screens/emtycarwhishlistt.dart';
import 'package:partsbay/screens/menuscreem.dart';
import 'package:partsbay/screens/whishlist.dart';

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

class CartWhishlistdatafetch extends StatelessWidget {
  late final String uid;
  late final int whishcartindex;
  late final String collection;

  CartWhishlistdatafetch(
      {Key? key,
      required this.uid,
      required this.whishcartindex,
      required this.collection})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('user')
            .doc(uid)
            .collection(collection)
            .snapshots(includeMetadataChanges: true),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container(child: Text("Something went wrong"));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Loadingpage();
          } else if (snapshot.hasData) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            List<StatefulWidget> whishcartlist = [
              Cartscreen(
                data: data,
              ),
              Whishlistpage(
                data: data,
              )
            ];
            if (data.isNotEmpty == true) {
              return whishcartlist[whishcartindex];
            } else {
              return Emptycartwhishlist(title: collection);
            }
          } else {
            return Loadingpage();
          }
        });
  }
}

Widget cartcount(String id) {
  return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .doc(id)
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          DocumentSnapshot<Map<String, dynamic>> data = snapshot.data;

          if (data.exists == true) {
            return Text(
              '${data.get('count')}',
              style: GoogleFonts.lato(fontSize: 15, color: blue),
            );
          } else {
            return Text('');
          }
        }

        return Text('');
      });
}
