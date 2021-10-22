import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 115,
            color: blue,
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
                          color: pink,
                        )),
                    _searchbar(context),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 2,
            child: StreamBuilder<QuerySnapshot>(
              stream: prod
                  .where('title', isEqualTo: controller.text)
                  .snapshots(includeMetadataChanges: true),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(controller.text);
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }

                if (snapshot.connectionState == ConnectionState.active ||
                    snapshot.connectionState == ConnectionState.done) {
                  List<DocumentSnapshot> data = snapshot.data!.docs;
                  print(data.length);
                  if (data.isEmpty) {
                    return Scaffold(
                        body: Center(
                            child: Text("Not found",
                                style: GoogleFonts.lato(
                                    color: pink, fontSize: 20))));
                  }
                  print(data.length);
                  print(data[0].get('price').toString());

                  return Expanded(
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
                  );
                }

                return Loadingpage();
              },
            ),
          ),
        ],
      ),
    );
  }
}

Widget _searchbar(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.8,
    height: 45,
    child: TextFormField(
      onChanged: (val) {},
      enabled: true,
      autofocus: true,
      cursorHeight: 25,
      controller: controller,
      decoration: InputDecoration(
          focusColor: Colors.grey.shade200,
          filled: true,
          hintText: "Search spares,helmets,gears here..",
          fillColor: Colors.grey.shade200,
          suffix: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.close,
                color: pink,
                size: 20,
              )),
          border: ouit(),
          errorBorder: ouit(),
          enabledBorder: ouit(),
          focusedBorder: ouit(),
          disabledBorder: ouit(),
          focusedErrorBorder: ouit()),
    ),
  );
}

OutlineInputBorder ouit() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(15),
    borderSide: BorderSide.none,
  );
}
