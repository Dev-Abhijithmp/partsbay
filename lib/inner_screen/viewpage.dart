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
    height: 100,
    width: double.infinity,
    color: blue,
    child: Row(
      children: [
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(242, 50, 134, 1),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 80,
        ),
        Container(
          margin: EdgeInsets.only(top: 10),
          height: 50,
          width: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            image: DecorationImage(
                image: AssetImage("icons/plogo.jpeg"), fit: BoxFit.fill),
          ),
        ),
        Spacer()
      ],
    ),
  );
}

Widget singleItem(List<dynamic> url, String title, double price) {
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
