import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/itempage.dart';

class Viewpage extends StatelessWidget {
  final List<DocumentSnapshot> data;

  Viewpage({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(data.length);
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
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
                        data[index].get('url'),
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
    height: 100,
    width: double.infinity,
    color: green,
    child: Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 80,
        ),
        Text(
          "Partsbay",
          style: GoogleFonts.oxygen(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        Spacer()
      ],
    ),
  );
}

Widget singleItem(List<dynamic> url, String title, double price) {
  print(url[0]);
  return SizedBox(
    height: 300,
    width: 160,
    child: Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 160,
            child: Image.network(
              url[0].toString(),
              scale: 1,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            title,
            style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '₹' + "$price",
            style: GoogleFonts.lato(
              fontSize: 10,
            ),
          ),
        ],
      ),
    ),
  );
}
