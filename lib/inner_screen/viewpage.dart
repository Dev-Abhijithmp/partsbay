// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:partsbay/fetchdata/classes.dart';

class Viewpage extends StatefulWidget {
  late List<Items> products;
  Viewpage(List<Items> products, {Key? key}) : super(key: key);

  @override
  _ViewpageState createState() => _ViewpageState();
}

class _ViewpageState extends State<Viewpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            viewAppbar(context),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (BuildContext context, index) {
                  return singleItem(products[index].urls, products[index].title,
                      products[index].price);
                },
                itemCount: products.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget viewAppbar(context) {
  return Container(
    height: 115,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(80, 167, 194, 1),
          Color.fromRGBO(183, 248, 219, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 80,
        ),
        Text("Partsbay"),
        Spacer()
      ],
    ),
  );
}

Widget singleItem(List<String> url, String title, double price) {
  return Card(
    child: Container(
      height: 220,
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 100,
            height: 150,
            child: Image.network(
              url[0],
              fit: BoxFit.cover,
            ),
          ),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
          Text(
            "$price",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
          ),
        ],
      ),
    ),
  );
}
