import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/admin/inneradminpages/updatedata.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Updateitems extends StatelessWidget {
  const Updateitems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Items'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatedata(field: "title")));
            },
            child: Container(
              child: Center(
                  child: Text("Update title",
                      style: GoogleFonts.lato(fontSize: 20, color: white))),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatedata(field: "description")));
            },
            child: Container(
              child: Center(
                  child: Text(
                "Update description",
                style: GoogleFonts.lato(fontSize: 20, color: white),
                textAlign: TextAlign.center,
              )),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatedata(field: "category")));
            },
            child: Container(
              child: Center(
                child: Text(
                  "Update category",
                  style: GoogleFonts.lato(fontSize: 20, color: white),
                  textAlign: TextAlign.center,
                ),
              ),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatedata(field: "price")));
            },
            child: Container(
              child: Center(
                  child: Text("Update price",
                      style: GoogleFonts.lato(fontSize: 20, color: white))),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Updatedata(field: "count")));
            },
            child: Container(
              child: Center(
                  child: Text("Update count",
                      style: GoogleFonts.lato(fontSize: 20, color: white))),
              height: 50,
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
