import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
                  SizedBox(
                    height: 10,
                  ),
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
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Categories",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  _categories(),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Shop by Bikes",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  _shopbybikes(),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Card(
                    margin: EdgeInsets.all(8),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                      ),
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
                          return Image.asset(
                            img[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
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
    height: 115,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        Color.fromRGBO(80, 167, 194, 1),
        Color.fromRGBO(183, 248, 219, 1)
      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      /*boxShadow: [
        BoxShadow(
            blurRadius: 1,
            spreadRadius: 1,
            color: Colors.black54,
            offset: Offset(0, 1))
      ],*/
    ),
    child: Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.location_on,
                  color: Color.fromRGBO(223, 61, 126, 1),
                ),
                label: Text(
                  "$latitude,$logtitude",
                  style: TextStyle(
                    color: Color.fromRGBO(223, 61, 126, 1),
                  ),
                )),
            Spacer(),
            Text(
              "Partsbay",
              style: TextStyle(
                fontSize: 30,
                color: Color.fromRGBO(1, 42, 74, 1),
              ),
            ),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 10,
            ),
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
                    Text("Search spares,helmets,gears here..")
                  ],
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Myicons.heart_empty,
                  size: 20,
                ))
          ],
        )
      ],
    ),
  );
}

Widget _shopbybikes() {
  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Card(child: Image.asset("images/duke390.jpeg")),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(child: Image.asset("images/g310.jpeg")),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              child: Image.asset("images/himalayan.jpeg"),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(child: Image.asset("images/ninja.jpeg")),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(child: Image.asset("images/duke390.jpeg")),
          ),
        ],
      ),
    ),
  );
}

Widget _categories() {
  return Container(
    width: double.infinity,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              child: Image.network(
                  "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              child: Image.network(
                  "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"),
            ),
          ),
          SizedBox(
            width: 100,
            height: 100,
            child: Card(
              child: Image.network(
                  "https://www.pngfind.com/pngs/m/375-3753305_clip-transparent-library-car-jeep-tire-motor-vehicle.png"),
            ),
          ),
        ],
      ),
    ),
  );
}
