import 'package:flutter/material.dart';
import 'package:partsbay/myicons_icons.dart';
import 'package:partsbay/screens/cart.dart';
import 'package:partsbay/screens/homepage.dart';
import 'package:partsbay/screens/offlinepage.dart';
import 'package:partsbay/screens/orderscreen.dart';
import 'package:partsbay/screens/menuscreem.dart';

class Bottompage extends StatefulWidget {
  Bottompage({Key? key}) : super(key: key);

  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      Homepage(),
      Offlinepage(),
      Cartscreen(),
      Orderscreen(),
      MenuScreen(),
    ];

    void selectedstate(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
      extendBody: true,
      body: pages[selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Color.fromRGBO(223, 61, 126, 1),
          showUnselectedLabels: true,
          currentIndex: selectedIndex,
          onTap: selectedstate,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Offline",
              icon: Icon(
                Icons.gps_fixed_outlined,
                size: 20,
              ),
            ),
            BottomNavigationBarItem(
              label: "Cart",
              icon: Icon(Myicons.opencart),
            ),
            BottomNavigationBarItem(
              label: "Orders",
              icon: Icon(Icons.offline_bolt),
            ),
            BottomNavigationBarItem(
              label: "Menu",
              icon: Icon(
                Icons.menu,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
