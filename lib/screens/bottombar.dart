import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/fetchdata/firestore.dart';
import 'package:partsbay/myicons_icons.dart';
import 'package:partsbay/provider/changeprovider.dart';
import 'package:partsbay/screens/cart.dart';
import 'package:partsbay/screens/homepage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

class Bottompage extends StatefulWidget {
  Bottompage({Key? key}) : super(key: key);

  @override
  _BottompageState createState() => _BottompageState();
}

class _BottompageState extends State<Bottompage> {
  String uid = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    print(uid);
    List<Widget> pages = [Homepage(), Cartscreen(), Profilefetch(uid: uid)];

    return Stack(
      children: [
        Scaffold(
          body: pages[Provider.of<Change>(context).providerindex],
          extendBodyBehindAppBar: true,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: Scaffold(
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: bgcolor,
                color: Color.fromRGBO(147, 217, 163, 1),
                height: 50,
                items: [
                  Icon(
                    Icons.home,
                    color: Colors.black,
                  ),
                  Stack(
                    alignment: AlignmentDirectional.topEnd,
                    fit: StackFit.loose,
                    clipBehavior: Clip.antiAlias,
                    children: [
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.black,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: totalcartamount(),
                      ),
                    ],
                  ),
                  Icon(
                    Myicons.user_male,
                    size: 20,
                    color: Colors.black,
                  ),
                ],
                onTap: (index) {
                  Provider.of<Change>(context, listen: false)
                      .changeindex(index);
                },
              ),
            ),
          ),
        )
      ],
    );
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