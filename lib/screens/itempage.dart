import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class Itempage extends StatefulWidget {
  const Itempage({Key? key}) : super(key: key);

  @override
  _ItempageState createState() => _ItempageState();
}

class _ItempageState extends State<Itempage> {
  @override
  Widget build(BuildContext context) {
    List<String> img = [
      'images/duke390.jpeg',
      'images/g310.jpeg',
      'images/himalayan.jpeg',
      'images/ninja.jpeg'
    ];
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            itemAppbar(context),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    child: Swiper(
                      fade: 1,
                      autoplay: false,
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.red,
                        radius: 20,
                      )
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              width: double.infinity,
              height: 70,
              color: Colors.red,
              child: Center(
                  child: Text(
                "ADD TO CART",
                style: TextStyle(fontSize: 25),
              )),
            )
          ],
        ),
      ),
    );
  }
}

Widget itemAppbar(context) {
  return Container(
    height: 115,
    width: double.infinity,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromRGBO(80, 167, 194, 1),
          Color.fromRGBO(183, 248, 219, 1),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
    ),
    child: Row(
      children: [
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 80,
        ),
        Text("Partsbay"),
        Spacer()
      ],
    ),
  );
}
