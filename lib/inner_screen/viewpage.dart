import 'package:flutter/material.dart';

class Viewpage extends StatefulWidget {
  Viewpage({Key? key}) : super(key: key);

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
                  return singleItem();
                },
                itemCount: 10,
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

Widget singleItem() {
  return Card(
    margin: EdgeInsets.all(5),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset("images/himalayan.jpeg"),
        Text(
          "Title",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Text(
          "Price",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ],
    ),
  );
}
