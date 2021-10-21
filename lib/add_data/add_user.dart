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
  documentReference.collection('cart').doc();
  documentReference.collection('whishlist').doc();
  documentReference.collection('address').doc();
  documentReference.collection('orders').doc();
}

Future<void> addtowhishlist(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference
      .collection('whishlist')
      .doc(id)
      .set({'id': '', 'count': 0, 'title': '', 'description': ''});
}

Future<void> addtocart(context, String uid, int id, String url, double price,
    String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc(id.toString()).get();

  if (countdata.exists == false) {
    documentReference.collection('cart').doc(id.toString()).set({
      'id': id,
      'count': 1,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size
    });
  } else {
    documentReference
        .collection('cart')
        .doc(id.toString())
        .update({'count': (countdata.get('count') + 1)});
  }
}

Future<void> removefromcart(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  await documentReference.collection('cart').doc(id).delete();
}

Future<void> removefromwhishlist(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('whishlist').doc(id).update({'count': 0});
}
//Provider.of<Change>(context).cartcount