import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/fetchdata/firestore.dart';
import 'package:partsbay/inner_screen/itempage.dart';
import 'package:partsbay/inner_screen/loadingpage.dart';
import 'package:partsbay/inner_screen/viewpage.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

TextEditingController controller = TextEditingController();
List<DocumentSnapshot> searchList = [];

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: FutureBuilder<QuerySnapshot>(
        future: prod.get(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(controller.text);
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData == true) {
            List<DocumentSnapshot> data = snapshot.data!.docs;
            print(data.length);

            print(data.length);
            print(data[0].get('price').toString());

            return Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 115,
                  color: green,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      sizedh(45),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back,
                                color: blue,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 45,
                            child: TextFormField(
                              onChanged: (val) {
                                setState(() {
                                  searchList = data
                                      .where((element) => element
                                          .get('title')
                                          .toString()
                                          .toLowerCase()
                                          .contains(
                                              controller.text.toLowerCase()))
                                      .toList();
                                });
                              },
                              enabled: true,
                              autofocus: true,
                              cursorHeight: 25,
                              controller: controller,
                              decoration: InputDecoration(
                                  focusColor: Colors.grey.shade200,
                                  filled: true,
                                  hintText:
                                      "Search spares,helmets,gears here..",
                                  fillColor: Colors.grey.shade200,
                                  suffix: IconButton(
                                      onPressed: () {},
                                      icon: Icon(
                                        Icons.close,
                                        color: blue,
                                        size: 20,
                                      )),
                                  border: ouit(),
                                  errorBorder: ouit(),
                                  enabledBorder: ouit(),
                                  focusedBorder: ouit(),
                                  disabledBorder: ouit(),
                                  focusedErrorBorder: ouit()),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                searchList.isEmpty
                    ? Center(
                        child: Text("product not fount"),
                      )
                    : Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  childAspectRatio: 0.7, crossAxisCount: 2),
                          itemBuilder: (BuildContext context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return Itempage(data: searchList[index]);
                                }));
                              },
                              child: singleItem(
                                  searchList[index].get('url'),
                                  searchList[index].get('title'),
                                  searchList[index].get('price').toDouble()),
                            );
                          },
                          itemCount: searchList.length,
                        ),
                      ),
              ],
            );
          }

          return Loadingpage();
        },
      ),
    );
  }
}

OutlineInputBorder ouit() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
}
