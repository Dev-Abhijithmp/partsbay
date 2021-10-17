import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';

class Itempage extends StatefulWidget {
  final DocumentSnapshot data;
  const Itempage({Key? key, required this.data}) : super(key: key);

  @override
  _ItempageState createState() => _ItempageState(data);
}

class _ItempageState extends State<Itempage> {
  final DocumentSnapshot data;

  _ItempageState(this.data);
  @override
  Widget build(BuildContext context) {
    List<dynamic> links = data.get('urls');
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            itemAppbar(context),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 400,
                        child: Swiper(
                          fade: 1,
                          autoplay: false,
                          itemCount: links.length,
                          controller: SwiperController(),
                          pagination: SwiperPagination(
                            builder: SwiperPagination.dots,
                            alignment: Alignment.bottomCenter,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Image.network(
                                links[index],
                                fit: BoxFit.cover,
                              ),
                            );
                          },
                        ),
                      ),
                      Text(data.get('title')),
                      SizedBox(
                        height: 5,
                      ),
                      Text(data.get('description')),
                      SizedBox(
                        height: 5,
                      ),
                      Text(data.get('price').toString()),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                      Container(
                        width: double.infinity,
                        height: 500,
                        color: Colors.yellow,
                      )
                    ],
                  ),
                ),
              ),
            ),
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
