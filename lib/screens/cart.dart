import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/provider/changeprovider.dart';
import 'package:provider/provider.dart';

class Cartscreen extends StatefulWidget {
  late final List<DocumentSnapshot> data;
  Cartscreen({Key? key, required this.data}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState(data: data);
}

class _CartscreenState extends State<Cartscreen> {
  _CartscreenState({required this.data});
  late final List<DocumentSnapshot> data;
  @override
  Widget build(BuildContext context) {
    print(data.length);

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          viewAppbar1(context, "My Cart"),
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('user')
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .collection('cart')
                    .snapshots(includeMetadataChanges: true),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasData == true) {
                    List<DocumentSnapshot> cartdata = snapshot.data!.docs;
                    return SizedBox(
                      height: 200 * (cartdata.length).toDouble(),
                      width: double.infinity,
                      child: ListView.builder(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (BuildContext context, index) {
                          return singlecartitem(
                            context,
                            data[index].get('url'),
                            data[index].get('title'),
                            data[index].get('price').toDouble(),
                            data[index].get('description'),
                            data[index].get('size'),
                            data[index].get('id'),
                            data[index].get('count'),
                          );
                        },
                        itemCount: cartdata.length,
                      ),
                    );
                  } else {
                    return Text("");
                  }
                }),
          ),
          checkoutbutton(Provider.of<Change>(context).total),
          sizedh(55)
        ],
      ),
    );
  }
}
