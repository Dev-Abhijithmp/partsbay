import 'package:flutter/material.dart';

class Bottonpage extends StatefulWidget {
  Bottonpage({Key? key}) : super(key: key);

  @override
  _BottonpageState createState() => _BottonpageState();
}

class _BottonpageState extends State<Bottonpage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void selectedstate(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Home"),
      ),
      extendBody: true,
      body: Container(),
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          unselectedItemColor: Colors.yellow,
          selectedItemColor: Colors.blue,
          currentIndex: selectedIndex,
          onTap: selectedstate,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Icons.shopping_basket),
            ),
            BottomNavigationBarItem(
              label: "User",
              icon: Icon(Icons.verified_user),
            ),
            BottomNavigationBarItem(
              label: "Orders",
              icon: Icon(Icons.offline_bolt),
            ),
          ],
        ),
      ),
    );
  }
}
