import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:partsbay/add_data/add_user.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';
import 'package:partsbay/inner_screen/ordersucces.dart';

class Payment extends StatefulWidget {
  late final String uid;
  late final List<String> itemids;
  late final List<String> urls;
  late final List<String> sizes;
  late final int totalamount;
  late final List<Map<String, dynamic>> priceandcount;
  Payment(
      {Key? key,
      required this.uid,
      required this.itemids,
      required this.priceandcount,
      required this.sizes,
      required this.totalamount,
      required this.urls})
      : super(key: key);

  @override
  _PaymentState createState() => _PaymentState(
      uid: uid,
      itemids: itemids,
      urls: urls,
      sizes: sizes,
      totalamount: totalamount,
      priceandcount: priceandcount);
}

String? _month;
String? _year;
TextEditingController _cardNumberController = TextEditingController();
TextEditingController _cvvcontroller = TextEditingController();

class _PaymentState extends State<Payment> {
  late final String uid;
  late final List<String> itemids;
  late final List<String> urls;
  late final List<String> sizes;
  late final int totalamount;
  late final List<Map<String, dynamic>> priceandcount;
  _PaymentState(
      {required this.uid,
      required this.itemids,
      required this.priceandcount,
      required this.sizes,
      required this.totalamount,
      required this.urls});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment'),
        backgroundColor: green,
      ),
      backgroundColor: white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.30,
            margin: EdgeInsets.symmetric(horizontal: 20),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: green.withOpacity(0.7),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextField(
                  controller: _cardNumberController,
                  decoration: InputDecoration(
                    hintText: 'Card Number',
                    hintStyle: TextStyle(
                      color: blue,
                    ),
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 16,
                ),
                Row(
                  children: [
                    DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text("01"),
                          value: "01",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("02"),
                          value: "02",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("03"),
                          value: "03",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("04"),
                          value: "04",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("05"),
                          value: "05",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("06"),
                          value: "06",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("07"),
                          value: "07",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("08"),
                          value: "08",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("09"),
                          value: "09",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("10"),
                          value: "10",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("11"),
                          value: "11",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("12"),
                          value: "12",
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _month = value!;
                        });
                      },
                      hint: Text("Select month"),
                      value: _month,
                    ),
                    DropdownButton<String>(
                      items: [
                        DropdownMenuItem<String>(
                          child: Text("22"),
                          value: "22",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("23"),
                          value: "23",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("24"),
                          value: "24",
                        ),
                        DropdownMenuItem<String>(
                          child: Text("25"),
                          value: "25",
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _year = value!;
                        });
                      },
                      hint: Text("Select year"),
                      value: _year,
                    ),
                  ],
                ),
                TextField(
                  controller: _cvvcontroller,
                  decoration: InputDecoration(
                    hintText: 'CVV',
                    hintStyle: TextStyle(
                      color: blue,
                    ),
                    border: InputBorder.none,
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  maxLength: 3,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              if (_month == null ||
                  _year == null ||
                  _cardNumberController.text.length != 16 ||
                  _cvvcontroller.text.length != 3) {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Error'),
                      content: Text('Please fill all the fields'),
                      actions: [
                        ElevatedButton(
                          child: Text('Ok'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
              } else {
                if (_month == "06" &&
                    _year == "22" &&
                    _cvvcontroller.text == "123" &&
                    _cardNumberController.text == "1234567890123456") {
                  Map<String, dynamic> flag = await addorder(uid, itemids, urls,
                      sizes, totalamount, "prepaid", priceandcount);

                  if (flag['status'] == 'success') {
                    for (var item in itemids) {
                      await FirebaseFirestore.instance
                          .collection('user')
                          .doc(uid)
                          .collection('cart')
                          .doc(item)
                          .delete();
                    }
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Ordersucces(
                                  totalamount: totalamount,
                                )));
                  } else {
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text('Error'),
                              content: Text(flag['status']),
                              actions: [
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("ok"))
                              ],
                            ));
                  }
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Error'),
                        content: Text('Please select correct month and year'),
                        actions: [
                          ElevatedButton(
                            child: Text('Ok'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              }
            },
            child: Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: green,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  'Pay',
                  style: TextStyle(
                    color: white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
