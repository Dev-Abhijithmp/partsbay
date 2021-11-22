import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/add_data/add_user.dart';
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
          if (snapshot.hasData == true) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  List<dynamic> ss = data[index].get('itemids');
                  return Container(
                    height: 400 * (ss.length).toDouble(),
                    width: double.infinity,
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: ss.length,
                      itemBuilder: (BuildContext context, int index2) {
                        return singleorderitem(data[index], index2, context);
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

Widget singleorderitem(DocumentSnapshot _data, int _index2, context) {
  return Container(
    height: 380,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(20),
      border: Border.all(color: green),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 100,
          width: 100,
          child: Image.network(_data['urls'][0].toString()),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text('order id'), Text("-"), Text(_data.id)],
        ),
        _data.get('status') != 'delivered'
            ? InkWell(
                onTap: () async {
                  Map<String, dynamic> _flag = await removeorder(_data.id);
                  if (_flag['status'] == 'success') {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Success'),
                              content: Text('order removed'),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok"))
                              ],
                            ));
                  } else {}
                },
                child: Container(
                  height: 30,
                  width: 150,
                  child: Center(
                    child: Text("remove order"),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20), color: green),
                ),
              )
            : Container(),
      ],
    ),
  );
}
