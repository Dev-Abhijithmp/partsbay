import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          Spacer(),
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
      enabled: true,
      autofocus: true,
      cursorHeight: 25,
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
