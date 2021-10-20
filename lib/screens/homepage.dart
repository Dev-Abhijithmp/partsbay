import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/fetchdata/firestore.dart';
import 'package:partsbay/myicons_icons.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:partsbay/screens/searchpage.dart';

class Homepage extends StatefulWidget {
  Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    double latitude = 0;
    double logtitude = 0;
    /*Future getloc() async {
      Position data = await Geolocator.getCurrentPosition();
      print(data.altitude);
      setState(() {
        latitude = data.latitude;
        logtitude = data.longitude;
        print(latitude);
      });
    }
*/
    //enablegps();
    //getloc();

    List<String> img = [
      'images/duke390.jpeg',
      'images/g310.jpeg',
      'images/himalayan.jpeg',
      'images/ninja.jpeg'
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          _appbar(context, latitude, logtitude),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  sizedh(10),
                  Container(
                    height: 200,
                    child: Swiper(
                      fade: 1,
                      autoplay: true,
                      itemCount: img.length,
                      controller: SwiperController(),
                      pagination: SwiperPagination(
                        builder: SwiperPagination.dots,
                        alignment: Alignment.bottomCenter,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: Image.asset(
                            img[index],
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                  ),
                  sizedh(20),
                  Row(
                    children: [
                      sizedw(20),
                      Text(
                        "Categories",
                        style: GoogleFonts.lato(color: blue, fontSize: 20),
                      ),
                    ],
                  ),
                  sizedh(20),
                  _categories(context),
                  sizedh(20),
                  Row(
                    children: [
                      sizedw(20),
                      Text(
                        "Shop by bikes",
                        style: GoogleFonts.lato(color: blue, fontSize: 20),
                      ),
                    ],
                  ),
                  _shopbybikes(),
                  sizedh(60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _appbar(context, double latitude, double logtitude) {
  return Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
      color: blue,
      boxShadow: [
        BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.black54,
            offset: Offset(0, 1))
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 7,
        ),
        Row(
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: pink,
                ),
                label: Text(
                  "$latitude,$logtitude",
                  style: TextStyle(
                    color: pink,
                  ),
                )),
            Spacer(),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                    image: AssetImage("icons/plogo.jpeg"), fit: BoxFit.fill),
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            sizedw(10),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return Searchpage();
                }));
              },
              child: Container(
                padding: EdgeInsets.all(5),
                height: 40,
                width: MediaQuery.of(context).size.width * 0.65,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  border: Border.all(color: Colors.grey.shade200, width: 1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search),
                    Expanded(
                        child: Text("Search spares,helmets,gears here..",
                            style: GoogleFonts.lato(
                              color: blue,
                            ))),
                  ],
                ),
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
              color: pink,
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Myicons.heart_empty,
                  size: 20,
                  color: pink,
                ))
          ],
        )
      ],
    ),
  );
}

Widget _shopbybikes() {
  List<String> img = [
    "images/duke390.jpeg",
    "images/g310.jpeg",
    "images/himalayan.jpeg",
    "images/ninja.jpeg",
    "images/duke390.jpeg"
  ];
  return SizedBox(
    height: 60 * (img.length * 2),
    width: double.infinity,
    child: GridView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      controller: ScrollController(keepScrollOffset: false),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return SizedBox(
          height: 100,
          width: 100,
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  img[index],
                  fit: BoxFit.contain,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    "Bike",
                    style: GoogleFonts.lato(color: blue, fontSize: 15),
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: img.length,
    ),
  );
}

Widget _categories(context) {
  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Catadata(
                  docdata: "jackets",
                );
              }));
            },
            child: SizedBox(
              width: 110,
              height: 150,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      child: Image.network(
                          "https://5.imimg.com/data5/TR/XS/MY-3513908/htb1zf4egfxxxxxxxpxxq6xxfxxxq-1000x1000.jpg"),
                    ),
                    Text(
                      "Jackets",
                      style: GoogleFonts.lato(color: blue, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Catadata(
                  docdata: "helmets",
                );
              }));
            },
            child: SizedBox(
              width: 110,
              height: 150,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      child: Image.network(
                        "https://images.unsplash.com/photo-1603799091901-f0034ac3e7fa?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Text(
                      "Helmets",
                      style: GoogleFonts.lato(color: blue, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Catadata(
                  docdata: "gloves",
                );
              }));
            },
            child: SizedBox(
              width: 110,
              height: 150,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      child: Image.network(
                          "https://images-eu.ssl-images-amazon.com/images/I/51H8sdJdXBL._SX300_SY300_QL70_FMwebp_.jpg"),
                    ),
                    Text(
                      "Gloves",
                      style: GoogleFonts.lato(color: blue, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return Catadata(
                  docdata: "boots",
                );
              }));
            },
            child: SizedBox(
              width: 110,
              height: 150,
              child: Card(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 70,
                      child: Image.network(
                          "https://m.media-amazon.com/images/I/812HUl6A1YL._SL1500_.jpg"),
                    ),
                    Text(
                      "Boots",
                      style: GoogleFonts.lato(color: blue, fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
