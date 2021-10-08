import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Cartscreen extends StatefulWidget {
  const Cartscreen({Key? key}) : super(key: key);

  @override
  _CartscreenState createState() => _CartscreenState();
}

class _CartscreenState extends State<Cartscreen> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    bool cartlfag = true;
    if (cartlfag == true) {
      return nonemptycart(context);
    } else {
      return emptycart(context);
    }
  }
}

//the  function emptycart contain ui data of emty cart page
Widget emptycart(context) {
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
                "Your cart is empty",
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(onPressed: () {}, child: Text("Contine Shopping"))
          ],
        ),
      ),
    ),
  );
}

//the function non empty cart contain data of cart page that contain items
Widget nonemptycart(context) {
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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 30,
            ),
            Card(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    child: Image.asset(
                      "images/duke390.jpeg",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name'),
                      Text("price"),
                      Text("Subtotal"),
                      Row(
                        children: [
                          Text("Ships free"),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.minimize_sharp)),
                          Container(
                            width: 20,
                            height: 20,
                            color: Colors.yellow.shade200,
                          ),
                          IconButton(onPressed: () {}, icon: Icon(Icons.add))
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, boxShadow: [
                BoxShadow(offset: Offset(0, 0), spreadRadius: 1, blurRadius: 1),
              ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      "checkout",
                      textAlign: TextAlign.center,
                    ),
                    width: 150,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    "Grand total = 200",
                    style: TextStyle(),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}
