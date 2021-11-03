import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';

import 'emtycart.dart';

class Whishlistpage extends StatefulWidget {
  late final String uid;
  Whishlistpage({Key? key, required this.uid}) : super(key: key);

  @override
  _WhishlistpageState createState() => _WhishlistpageState(uid: uid);
}

class _WhishlistpageState extends State<Whishlistpage> {
  _WhishlistpageState({required this.uid});
  late final String uid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          viewAppbar1(context, "Whislist"),
          Container(
            height: MediaQuery.of(context).size.height - 100,
            width: double.infinity,
            child: StreamBuilder<QuerySnapshot>(
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
                      return Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.8, crossAxisCount: 2),
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, index) {
                            return singlewhishlistitem(
                                context,
                                data[index].get('url'),
                                data[index].get('title'),
                                data[index].get('price').toDouble(),
                                data[index].get('description'),
                                data[index].get('id'));
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
          ),
        ],
      ),
    );
  }
}
