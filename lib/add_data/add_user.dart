import 'package:cloud_firestore/cloud_firestore.dart';

CollectionReference user = FirebaseFirestore.instance.collection('user');

Future<void> createuserprofile(
  String uid,
  String email,
) async {
  DocumentReference documentReference = user.doc(uid);

  documentReference.set({
    'id': uid,
    'name': "",
    'email': email,
    'role': "user",
  });
}

Future<void> addtocart(context, String uid, String cartid, String url,
    double price, String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc(cartid).get();

  if (countdata.exists == false) {
    await documentReference.collection('cart').doc(cartid).set({
      'id': cartid,
      'count': 1,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size,
      'total': price
    });
  } else {
    await documentReference
        .collection('cart')
        .doc(cartid)
        .update({'count': (countdata.get('count') + 1)});
    await documentReference
        .collection('cart')
        .doc(cartid)
        .update({'total': ((countdata.get('count') + 1) * price)});
  }
}

Future<void> addtowishlist(context, String uid, String whishid, String url,
    double price, String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('wishlist').doc(whishid).get();

  if (countdata.exists == false) {
    await documentReference.collection('wishlist').doc(whishid).set({
      'id': whishid,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size
    });
  } else {
    await documentReference
        .collection('cart')
        .doc(whishid)
        .update({'count': (countdata.get('count') + 1)});
  }
}

Future<void> subtractcount(
    String uid, String cartid, double price, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc(cartid).get();
  if (countdata['count'] > 1) {
    await documentReference
        .collection('cart')
        .doc(cartid)
        .update({'count': (countdata.get('count') - 1)});
    await documentReference
        .collection('cart')
        .doc(cartid)
        .update({'total': ((countdata.get('count') - 1) * price)});
  } else {
    removefromcart(uid, cartid);
  }
}

Future<void> removefromcart(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  await documentReference.collection('cart').doc(id).delete();
}

Future<void> removefromwishlist(String uid, String whishid) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('wishlist').doc(whishid).delete();
}

//Provider.of<Change>(context).cartcount

Future<void> addorder(String uid) async {
  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await FirebaseFirestore.instance.collection('orders').get();

  if (querySnapshot.docs.isEmpty == true) {
    await FirebaseFirestore.instance.collection('orders').doc('1').set({});
  } else {
    await FirebaseFirestore.instance.collection('orders').doc('1').set({});
  }
}
