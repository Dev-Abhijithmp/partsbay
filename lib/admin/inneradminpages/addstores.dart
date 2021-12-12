import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/admin/addproducts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Addstores extends StatefulWidget {
  const Addstores({Key? key}) : super(key: key);

  @override
  _AddstoresState createState() => _AddstoresState();
}

class _AddstoresState extends State<Addstores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add stores"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(hintText: "store id"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "Location",
              style: GoogleFonts.lato(
                fontSize: 20,
                color: blue,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(hintText: "latitude"),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: TextField(
              decoration: InputDecoration(hintText: "longitude"),
            ),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: blue)),
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.all(5),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  child: TextField(
                    decoration: InputDecoration(hintText: "product id"),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text("S"),
                          value: "s",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("M"),
                          value: "m",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("L"),
                          value: "l",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("XL"),
                          value: "xl",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("XXl"),
                          value: "xxl",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("XXXl"),
                          value: "xxxl",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("Fixed size"),
                          value: "fs",
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          sizecontroller = value!;
                        });
                      },
                      hint: Text("Select size"),
                      value: sizecontroller,
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.45,
                      child: TextFormField(
                        controller: countcontroller,
                        decoration: InputDecoration(labelText: "Count"),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      if (sizecontroller == null ||
                          countcontroller.text == "") {
                        showDialog(
                            context: context,
                            builder: (context) => alertDialog("Error",
                                "please fill all the fieldes", context));
                      } else {
                        sizecountdata.add({
                          'size': sizecontroller!.toLowerCase(),
                          'sizecount': int.parse(countcontroller.text)
                        });
                        showDialog(
                            context: context,
                            builder: (context) => alertDialog(
                                "Suceess", 'data added to cache', context));
                      }
                    },
                    child: Text("Add one product"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
