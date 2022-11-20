// ignore_for_file: unused_element, unused_local_variable, unused_field, unused_import, deprecated_member_us
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_swiper_tv/flutter_swiper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partsbay/admin/admindatamanagement.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Addproducts extends StatefulWidget {
  Addproducts({Key? key}) : super(key: key);

  @override
  _AddproductsState createState() => _AddproductsState();
}

String? categorydata;
String? sizecontroller;
TextEditingController countcontroller = TextEditingController();
TextEditingController pricecontroller = TextEditingController();
List<Map<String, dynamic>> sizecountdata = [];
TextEditingController titlecontroller = TextEditingController();
TextEditingController idcontroller = TextEditingController();
TextEditingController bikecontroller = TextEditingController();
TextEditingController vendorcontroller = TextEditingController();
TextEditingController descriptioncontroller = TextEditingController();
List<File>? _pickedImage;

class _AddproductsState extends State<Addproducts> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    void _pickImageGallery() async {
      final picker = ImagePicker();
      List<XFile>? pickedImage = await picker.pickMultiImage(
        imageQuality: 100,
      );
      List<File>? pickedImageFile = [];
      if (pickedImage == null) {
        pickedImageFile = null;
      } else {
        for (var item in pickedImage) {
          pickedImageFile.add(File(item.path));
        }
      }

      setState(() {
        _pickedImage = pickedImageFile;
      });
      // widget.imagePickFn(pickedImageFile);
    }

    void _removeImage() {
      setState(() {
        _pickedImage = null;
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Add products"),
      ),
      backgroundColor: white,
      bottomSheet: Container(
        height: kBottomNavigationBarHeight * 0.8,
        width: double.infinity,
        child: Material(
          color: Colors.blue,
          child: InkWell(
            onTap: () async {
              if (titlecontroller.text == "" ||
                  idcontroller.text == "" ||
                  vendorcontroller.text == "" ||
                  descriptioncontroller.text == "" ||
                  categorydata == null ||
                  _pickedImage == null) {
                showDialog(
                    context: context,
                    builder: (context) => alertDialog(
                        "Error", "please fill all the fieldes", context));
              } else {
                Map<String, String> flag = await uploadproduct(
                    int.parse(idcontroller.text),
                    _pickedImage!,
                    sizecountdata,
                    bikecontroller.text,
                    categorydata.toString(),
                    descriptioncontroller.text,
                    titlecontroller.text,
                    int.parse(pricecontroller.text));
                if (flag['status'] != 'success') {
                  showDialog(
                      context: context,
                      builder: (context) =>
                          alertDialog("Error", flag['status'], context));
                } else {
                  bikecontroller.value = countcontroller.value =
                      descriptioncontroller.value = idcontroller.value =
                          vendorcontroller.value =
                              titlecontroller.value = TextEditingValue.empty;
                  categorydata = _pickedImage = sizecontroller = null;
                  showDialog(
                      context: context,
                      builder: (context) =>
                          alertDialog("success", flag['status'], context));
                }
              }
            },
            splashColor: Colors.grey,
            child: Padding(
              padding: const EdgeInsets.only(right: 2),
              child: Container(
                child: Text('Upload',
                    style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              sizedh(10),
              _pickedImage == null
                  ? Container(
                      height: 200,
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      decoration:
                          BoxDecoration(border: Border.all(color: blue)),
                    )
                  : Container(
                      height: 200,
                      child: Swiper(
                        fade: 1,
                        autoplay: true,
                        itemCount: _pickedImage!.length,
                        controller: SwiperController(),
                        pagination: SwiperPagination(
                          builder: SwiperPagination.dots,
                          alignment: Alignment.bottomCenter,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Card(child: Image.file(_pickedImage![index]));
                        },
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(8),
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: idcontroller,
                      decoration: InputDecoration(labelText: "id"),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: titlecontroller,
                      decoration: InputDecoration(labelText: "title"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: bikecontroller,
                      decoration: InputDecoration(labelText: "bike"),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: vendorcontroller,
                      decoration: InputDecoration(labelText: "vendor"),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.45,
                    child: TextFormField(
                      controller: pricecontroller,
                      decoration: InputDecoration(labelText: "price"),
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    ),
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            _pickImageGallery();
                          },
                          child: Text("   Add image   ")),
                      ElevatedButton(
                          onPressed: () {
                            _removeImage();
                          },
                          child: Text("Remove image"))
                    ],
                  ),
                  SizedBox(
                    width: 8,
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(border: Border.all(color: blue)),
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DropdownButton<String>(
                          items: [
                            DropdownMenuItem<String>(
                              child: Text("S"),
                              value: "s",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("M"),
                              value: "m",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("L"),
                              value: "l",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("XL"),
                              value: "xl",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("XXl"),
                              value: "xxl",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("XXXl"),
                              value: "xxxl",
                            ),
                            DropdownMenuItem<String>(
                              child: Text("Fixed size"),
                              value: "fs",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              sizecontroller = value!;
                            });
                          },
                          hint: Text("Select size"),
                          value: sizecontroller,
                        ),
                        Container(
                          padding: EdgeInsets.all(8),
                          height: 60,
                          width: MediaQuery.of(context).size.width * 0.45,
                          child: TextFormField(
                            controller: countcontroller,
                            decoration: InputDecoration(labelText: "Count"),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (sizecontroller == null ||
                              countcontroller.text == "") {
                            showDialog(
                                context: context,
                                builder: (context) => alertDialog("Error",
                                    "please fill all the fieldes", context));
                          } else {
                            sizecountdata.add({
                              'size': sizecontroller!.toLowerCase(),
                              'sizecount': int.parse(countcontroller.text)
                            });
                            showDialog(
                                context: context,
                                builder: (context) => alertDialog(
                                    "Suceess", 'data added to cache', context));
                          }
                        },
                        child: Text("Add size and count"))
                  ],
                ),
              ),
              DropdownButton<String>(
                items: [
                  DropdownMenuItem<String>(
                    child: Text("jackets"),
                    value: "jackets",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("gloves"),
                    value: "gloves",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("helmets"),
                    value: "helmets",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("boots"),
                    value: "boots",
                  ),
                  DropdownMenuItem<String>(
                    child: Text("parts"),
                    value: "parts",
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    categorydata = value!;
                  });
                },
                hint: Text("Select category"),
                value: categorydata,
              ),
              TextFormField(
                controller: descriptioncontroller,
                decoration: InputDecoration(labelText: "description"),
                maxLines: 3,
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
