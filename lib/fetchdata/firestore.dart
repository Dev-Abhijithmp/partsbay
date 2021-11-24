import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';
import 'package:partsbay/inner_screen/viewpage.dart';

import 'package:partsbay/screens/emtycart.dart';
import 'package:partsbay/screens/menuscreen.dart';

CollectionReference prod = FirebaseFirestore.instance.collection('products');
CollectionReference usr = FirebaseFirestore.instance.collection('user');

class Catadata extends StatelessWidget {
  //cls catata is used tofetch category  based data
  final String docdata;
  Catadata({Key? key, required this.docdata}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: prod.where('category', isEqualTo: docdata).get(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return SOmethingwentwrong();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<DocumentSnapshot> data = snapshot.data!.docs;
          if (data.isEmpty) {
            return SOmethingwentwrong();
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
    return StreamBuilder<QuerySnapshot>(
      stream: prod
          .where('title', arrayContains: str)
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return SOmethingwentwrong();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          List<DocumentSnapshot> data = snapshot.data!.docs;
          if (data.isEmpty) {
            return SOmethingwentwrong();
          }
          print(data.length);

          return Viewpage(
            data: data,
          );
        }

        return Loadingpage();
      },
    );
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
            return SOmethingwentwrong();
          }

          if (snapshot.connectionState == ConnectionState.done) {
            DocumentSnapshot data = snapshot.data!;

            if (snapshot.data!.exists == true) {
              return MenuScreen(data: data);
            } else {
              return SOmethingwentwrong();
            }
          }

          return Loadingpage();
        });
  }
}

class Whishlistdatafetch extends StatelessWidget {
  late final String uid;

  Whishlistdatafetch({
    Key? key,
    required this.uid,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          viewAppbar1(context, "Whislist"),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('user')
                  .doc(uid)
                  .collection('cart')
                  .snapshots(includeMetadataChanges: true),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Container(child: Text("Something went wrong"));
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return Loadingpage();
                } else if (snapshot.hasData) {
                  List<DocumentSnapshot> data = snapshot.data!.docs;

                  if (data.isNotEmpty == true) {
                    return SizedBox(
                      width: double.infinity,
                      height: 250 * (data.length).toDouble(),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, index) {
                          return singlewishlistitem(
                            context,
                            data[index].get('url'),
                            data[index].get('title'),
                            data[index].get('price').toDouble(),
                            data[index].get('description'),
                            data[index].get('id'),
                            data[index].get('mainid'),
                          );
                        },
                        itemCount: data.length,
                      ),
                    );
                  } else {
                    return Emptycart(title: "whishlist");
                  }
                } else {
                  return Loadingpage();
                }
              }),
        ],
      ),
    );
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

Widget totalcartcount() {
  return StreamBuilder<QuerySnapshot>(
      stream: FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart')
          .snapshots(includeMetadataChanges: true),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          List<DocumentSnapshot> data = snapshot.data!.docs;
          if (data.isNotEmpty) {
            double total = 0;
            for (var item in data) {
              total = total + item.get('count');
            }
            return Text(
              "${total.round()}",
              style: GoogleFonts.lato(
                  fontSize: 17, color: pink, fontWeight: FontWeight.bold),
            );
          } else {
            return Text("");
          }
        }

        return Text("");
      });
}

Future<Map<String, String?>> addnametodatabase(String uid, String name) async {
  try {
    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'name': name,
    });
    return {'status': "success"};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

Future<Map<String, String?>> changeaddress(String uid, String address) async {
  try {
    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'address': address,
    });
    return {'status': "success"};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

Future<Map<String, String?>> changephone(String uid, String phone) async {
  try {
    await FirebaseFirestore.instance.collection('user').doc(uid).update({
      'phone': phone,
    });
    return {'status': "success"};
  } on FirebaseException catch (e) {
    return {'status': e.message.toString()};
  }
}

Future<Map<String, String?>> changepassword(String uid, String password) async {
  try {
    await FirebaseAuth.instance.currentUser!.updatePassword(password);
    return {'status': "success"};
  } on FirebaseException catch (e) {
    return {'status': e.message.toString()};
  }
}
