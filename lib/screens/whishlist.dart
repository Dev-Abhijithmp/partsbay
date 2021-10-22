import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Whishlistpage extends StatefulWidget {
  late final List<DocumentSnapshot> data;
  Whishlistpage({Key? key, required this.data}) : super(key: key);

  @override
  _WhishlistpageState createState() => _WhishlistpageState(data: data);
}

class _WhishlistpageState extends State<Whishlistpage> {
  _WhishlistpageState({required this.data});
  late final List<DocumentSnapshot> data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          viewAppbar1(context, "Whislist"),
          SizedBox(
            height: 170 * (data.length).toDouble(),
            width: double.infinity,
            child: ListView.builder(
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
          ),
        ],
      ),
    );
  }
}
