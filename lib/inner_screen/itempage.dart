import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:partsbay/add_data/add_user.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/myicons_icons.dart';

class Itempage extends StatefulWidget {
  final DocumentSnapshot data;
  const Itempage({Key? key, required this.data}) : super(key: key);

  @override
  _ItempageState createState() => _ItempageState(data);
}

class _ItempageState extends State<Itempage> {
  final DocumentSnapshot data;

  _ItempageState(this.data);
  int sizeindex = 0;
  List<Color> clr = [
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
    Colors.grey.shade200,
  ];
  @override
  Widget build(BuildContext context) {
    List<dynamic> links = data.get('urls');
    List<dynamic> sizes = data.get('sizes');

    void changesize(int val) {
      setState(() {
        sizeindex = val;
      });
    }

    void changecolor(int val) {
      setState(() {
        clr[0] = Colors.grey.shade200;
        clr[1] = Colors.grey.shade200;
        clr[2] = Colors.grey.shade200;
        clr[3] = Colors.grey.shade200;
        clr[4] = Colors.grey.shade200;
        clr[5] = Colors.grey.shade200;

        clr[val] = pink;
      });
    }

    String id = data.get('id').toString();
    String uid = FirebaseAuth.instance.currentUser!.uid;
    return Scaffold(
      bottomSheet: Container(
        height: 70,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("price", style: GoogleFonts.oxygen()),
                SizedBox(
                  height: 5,
                ),
                Text('₹' + data.get('price').toString(),
                    style: GoogleFonts.oxygen(
                      fontSize: 20,
                    )),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            InkWell(
              onTap: () {
                addtocart(
                    context,
                    uid,
                    id,
                    links[0],
                    data.get('price').toDouble(),
                    data.get('description'),
                    data.get('title'),
                    sizes[sizeindex]);
                Navigator.pop(context);
              },
              child: Container(
                width: 150,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25), color: blue),
                child: Center(
                    child: Text(
                  "ADD TO CART",
                  style: GoogleFonts.lato(color: pink),
                )),
              ),
            ),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 500,
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
                              fit: BoxFit.contain,
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      data.get('title'),
                      style: GoogleFonts.lato(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: blue),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      data.get('description'),
                      style: GoogleFonts.lato(
                        color: blue,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: Center(
                        child: ListView.builder(
                          physics: ScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                                onTap: () {
                                  changesize(index);
                                  changecolor(index);
                                  print(sizes[sizeindex]);
                                },
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                  height: 40,
                                  width: 40,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(13),
                                      color: clr[index],
                                      border: Border.all(color: blue)),
                                  child: Center(
                                    child: Text(sizes[index].toUpperCase()),
                                  ),
                                ));
                          },
                          itemCount: sizes.length,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 70 * 4,
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          controller: ScrollController(keepScrollOffset: false),
                          itemCount: 4,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Card(
                                child: ListTile(
                                  leading: Text("Name"),
                                  title: Text("review"),
                                ),
                              ),
                            );
                          }),
                    ),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "view all reviews",
                          style: GoogleFonts.lato(color: pink),
                        )),
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          "Add review",
                          style: GoogleFonts.lato(color: pink),
                        )),
                    SizedBox(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              left: 20,
              top: 30,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: pink,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 35,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.shade300),
                child: IconButton(
                  icon: Icon(
                    Myicons.heart_empty,
                    size: 20,
                    color: pink,
                  ),
                  onPressed: () {
                    addtowhishlist(
                        context,
                        uid,
                        id,
                        links[0],
                        data.get('price').toDouble(),
                        data.get('description'),
                        data.get('title'),
                        sizes[sizeindex]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
