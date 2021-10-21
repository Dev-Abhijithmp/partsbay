import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference user = FirebaseFirestore.instance.collection('user');

Future<void> createuserprofile(
  String id,
  String email,
) async {
  DocumentReference documentReference = user.doc(id);

  documentReference.set({
    'id': id,
    'name': "",
    'email': email,
  });
  documentReference.collection('cart').doc(id).set({});
  documentReference.collection('address').doc(id).set({});
  documentReference.collection('whishlist').doc(id).set({});
}

Future<void> addtowhishlist(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference
      .collection('whishlist')
      .doc(id)
      .set({'id': '', 'count': 0, 'title': '', 'description': ''});
}

Future<void> addtocart(String uid, int id, String url, int price,
    String description, String title) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('cart').doc(id.toString()).set({
    'id': id,
    'count': 0,
    'title': title,
    'description': description,
    'url': url,
    'price': price,
  });
}

Future<void> removefromcart(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('cart').doc(id).update({'count': 0});
}

Future<void> removefromwhishlist(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('whishlist').doc(id).update({'count': 0});
}
