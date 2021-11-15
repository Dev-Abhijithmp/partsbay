import 'package:cloud_firestore/cloud_firestore.dart';

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
