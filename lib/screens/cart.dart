import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';
import 'package:partsbay/screens/emtycart.dart';

class Cartscreen extends StatefulWidget {
  Cartscreen({
    Key? key,
  }) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: Container(
        color: bgcolor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            viewAppbar1(context, "My Cart"),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('user')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart')
                      .snapshots(includeMetadataChanges: false),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (snapshot.hasError == true) {
                      return SOmethingwentwrong();
                    }
                    if (snapshot.hasData == true) {
                      List<DocumentSnapshot> cartdata = snapshot.data!.docs;
                      if (cartdata.length == 0) {
                        return Emptycart(title: 'cart');
                      } else {
                        return SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 230 * (cartdata.length).toDouble(),
                                width: double.infinity,
                                child: ListView.builder(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context, index) {
                                    return singlecartitem(
                                      context,
                                      cartdata[index].get('url'),
                                      cartdata[index].get('title'),
                                      cartdata[index].get('price').toDouble(),
                                      cartdata[index].get('description'),
                                      cartdata[index].get('size'),
                                      cartdata[index].get('id'),
                                      cartdata[index].get('count'),
                                    );
                                  },
                                  itemCount: cartdata.length,
                                ),
                              ),
                              StreamBuilder<QuerySnapshot>(
                                  stream: FirebaseFirestore.instance
                                      .collection('user')
                                      .doc(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      .collection('cart')
                                      .snapshots(includeMetadataChanges: true),
                                  builder: (context,
                                      AsyncSnapshot<QuerySnapshot> snapshot) {
                                    double total = 0.0;
                                    if (snapshot.hasData == true) {
                                      List<DocumentSnapshot> totaldata =
                                          snapshot.data!.docs;

                                      for (var item in totaldata) {
                                        total = total + item.get('total');
                                      }

                                      return checkoutbutton(
                                          total, context, cartdata);
                                    }
                                    return Container();
                                  })
                            ],
                          ),
                        );
                      }
                    } else {
                      return Loadingpage();
                    }
                  }),
            ),
            sizedh(50)
          ],
        ),
      ),
    );
  }
}
