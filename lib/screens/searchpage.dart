import 'package:flutter/material.dart';

class Searchpage extends StatefulWidget {
  const Searchpage({Key? key}) : super(key: key);

  @override
  _SearchpageState createState() => _SearchpageState();
}

class _SearchpageState extends State<Searchpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Center(child: _searchbar(context)),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

Widget _searchbar(context) {
  return Container(
    width: MediaQuery.of(context).size.width * 0.95,
    height: 55,
    child: TextFormField(
      enabled: true,
      autofocus: true,
      cursorHeight: 25,
      decoration: InputDecoration(
          focusColor: Colors.grey.shade200,
          filled: true,
          hintText: "Search spares,helmets,gears here..",
          fillColor: Colors.grey.shade200,
          prefix: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back)),
          suffix: IconButton(onPressed: () {}, icon: Icon(Icons.close)),
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
    borderRadius: BorderRadius.circular(10),
    borderSide: BorderSide.none,
  );
}
