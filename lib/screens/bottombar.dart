import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/fetchdata/firestore.dart';
import 'package:partsbay/myicons_icons.dart';
import 'package:partsbay/screens/homepage.dart';
import 'package:partsbay/screens/orderscreen.dart';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Bottompage extends StatefulWidget {
  Bottompage({Key? key}) : super(key: key);

  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  int selectedIndex = 0;
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    print(uid);
    List<Widget> pages = [Homepage(), Orderscreen(), Profilefetch(uid: uid)];

    void selectedstate(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    return Scaffold(
        extendBody: true,
        body: pages[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.white,
          color: blue,
          height: 50,
          items: [
            Icon(
              Icons.home,
              color: pink,
            ),
            Icon(
              Icons.local_shipping_outlined,
              color: pink,
            ),
            Icon(
              Myicons.user_male,
              size: 20,
              color: pink,
            ),
          ],
          onTap: (index) {
            selectedstate(index);
          },
        ));
  }
}
/*BottomAppBar(
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
      ), */