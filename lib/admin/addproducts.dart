// ignore_for_file: unused_element, unused_local_variable, unused_field, unused_import

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:partsbay/colorsandfontsandwidgets.dart';

class Addproducts extends StatefulWidget {
  Addproducts({Key? key}) : super(key: key);

  @override
  _AddproductsState createState() => _AddproductsState();
}

class _AddproductsState extends State<Addproducts> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    List<XFile>? _pickedImage;
    void _pickImageGallery() async {
      final picker = ImagePicker();
      List<XFile>? pickedImage = await picker.pickMultiImage(
        imageQuality: 100,
      );
      List<XFile>? pickedImageFile = pickedImage == null ? null : pickedImage;

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
      backgroundColor: white,
      bottomSheet: Container(
        height: kBottomNavigationBarHeight * 0.8,
        width: double.infinity,
        decoration: BoxDecoration(
          color: white,
          border: Border(
            top: BorderSide(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
        ),
        child: Material(
          color: Theme.of(context).backgroundColor,
          child: InkWell(
            onTap: () {},
            splashColor: Colors.grey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Container(
                    child: Text('Upload',
                        style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
