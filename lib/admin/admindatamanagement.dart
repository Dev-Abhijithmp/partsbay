import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
Future<Map<String, String?>> removeproducts(String productId) async {
  try {
    await _firestore.collection('products').doc(productId).delete();
    return {'status': 'success'};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

Future<Map<String, String?>> updatedata(
    String productId, String field, dynamic data) async {
  try {
    await _firestore
        .collection('products')
        .doc(productId)
        .update({field: data});
    return {'status': 'success'};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

Future<Map<String, String?>> updatecount(
    String productId, String size, int count) async {
  try {
    await _firestore
        .collection('products')
        .doc(productId)
        .collection('sizes&count')
        .doc(size)
        .update({'sizecount': count});
    return {'status': 'success'};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

FirebaseStorage firebaseStorage = FirebaseStorage.instance;
Future<Map<String, List<String>>> addimagetostorage(
    List<File> images, String id) async {
  try {
    List<String> url = [];
    for (var i = 0; i < images.length; i++) {
      await FirebaseStorage.instance
          .ref('productimages/$id' + i.toString() + 'jpeg')
          .putFile(images[i]);
      String sample = await FirebaseStorage.instance
          .ref('productimages/$id' + i.toString() + 'jpeg')
          .getDownloadURL();
      url.add(sample);
    }
    return {'status': url};
  } on FirebaseException catch (e) {
    return {
      'status': [e.message.toString()]
    };
  }
}

Future<void> setsizecount(String productId, String size, int count) async {
  await _firestore
      .collection('products')
      .doc(productId)
      .collection('sizes&count')
      .doc(size)
      .set({'sizecount': count, 'size': size});
}

Future<Map<String, String>> uploadproduct(
  int id,
  List<File> images,
  List<Map<String, dynamic>> sizecountdata,
  String bike,
  String category,
  String description,
  String title,
  int price,
) async {
  try {
    Map<String, List<String>> gturl =
        await addimagetostorage(images, id.toString());
    for (var item in sizecountdata) {
      await setsizecount(id.toString(), item['size'], item['sizecount']);
    }

    await _firestore.collection('products').doc(id.toString()).set({
      'bike': bike,
      'category': category,
      'description': description,
      'id': id,
      'price': price,
      'title': title,
      'url': gturl['status']
    });
    return {'status': "success"};
  } on FirebaseException catch (e) {
    return {'status': e.message.toString()};
  }
}
