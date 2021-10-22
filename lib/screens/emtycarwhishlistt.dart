import 'package:flutter/material.dart';

class Emptycartwhishlist extends StatelessWidget {
  late final String title;
  Emptycartwhishlist({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(80, 167, 194, 1),
              Color.fromRGBO(183, 248, 219, 1),
              Colors.white,
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  title + ' is empty',
                  style: TextStyle(fontSize: 40),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Contine Shopping"))
            ],
          ),
        ),
      ),
    );
  }
}
