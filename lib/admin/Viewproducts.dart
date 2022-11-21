

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/somethingwentwrong.dart';

class Viewproducts extends StatelessWidget {
  const Viewproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View products"),
      ),
      backgroundColor: white,
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('products').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return SOmethingwentwrong();
          } else if (snapshot.connectionState == ConnectionState.done) {
            List<DocumentSnapshot> productsData = snapshot.data!.docs;
            return ListView.builder(
              itemCount: productsData.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.blue,
                        width: 1,
                      ),
                    ),
                    child: Column(children: [
                      Text(
                        "Product id = ${productsData[index].get('id').toString()}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Product price = ${productsData[index].get('price').toString()}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Product title = ${productsData[index].get('title').toString()}",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Text(
                          "Count",
                          style: TextStyle(
                              fontSize: 20,
                              color: pink,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: FutureBuilder<QuerySnapshot>(
                            future: FirebaseFirestore.instance
                                .collection('products')
                                .doc(productsData[index].get('id').toString())
                                .collection('sizes&count')
                                .get(),
                            builder: (context, AsyncSnapshot snapshot1) {
                              if (snapshot1.hasData == true) {
                                List<DocumentSnapshot> sizesdata =
                                    snapshot1.data!.docs;
                                return ListView.builder(
                                  itemBuilder:
                                      (BuildContext context, int index2) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Size = " +
                                                  sizesdata[index2]
                                                      .get('size')
                                                      .toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                            Text("-",
                                                style: TextStyle(fontSize: 20)),
                                            Text(
                                              "Count = " +
                                                  sizesdata[index2]
                                                      .get('sizecount')
                                                      .toString(),
                                              style: TextStyle(fontSize: 20),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                      ],
                                    );
                                  },
                                  itemCount: sizesdata.length,
                                );
                              } else if (snapshot1.hasError == true) {
                                return SOmethingwentwrong();
                              } else {
                                return CircularProgressIndicator(
                                  value: 2,
                                );
                              }
                            }),
                      )
                    ]),
                  ),
                );
              },
            );
          } else {
            return Loadingpage();
          }
        },
      ),
    );
  }
}
