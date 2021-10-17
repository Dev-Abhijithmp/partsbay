import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/inner_screen/itempage.dart';

class Viewpage extends StatelessWidget {
  final List<DocumentSnapshot> data;

  Viewpage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data.length);
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            viewAppbar(context),
            Expanded(
              child: GridView.builder(
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.7, crossAxisCount: 2),
                itemBuilder: (BuildContext context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Itempage(data: data[index]);
                      }));
                    },
                    child: singleItem(
                        data[index].get('urls'),
                        data[index].get('title'),
                        data[index].get('price').toDouble()),
                  );
                },
                itemCount: data.length,
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

Widget singleItem(List<dynamic> url, String title, double price) {
  return Card(
    child: Container(
      height: 300,
      width: 160,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 160,
            child: Image.network(
              url[0].toString(),
              fit: BoxFit.fill,
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
