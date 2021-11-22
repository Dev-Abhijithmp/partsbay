import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    'orders': 0,
    'phone': "",
    'address': "",
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

Future<Map<String, dynamic>> addorder(
  String uid,
  List<String> itemids,
  List<String> urls,
  List<String> sizes,
  int totalamount,
  String mode,
  List<Map<String, dynamic>> priceandcount,
) async {
  DocumentSnapshot<Map<String, dynamic>> userdata =
      await FirebaseFirestore.instance.collection('user').doc(uid).get();

  try {
    FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .collection('orders')
        .doc(uid + (userdata.get('orders') + 1).toString())
        .set({
      'itemids': itemids,
      'urls': urls,
      'sizes': sizes,
      'price&count': priceandcount,
      'totalamount': totalamount,
      'mode': mode,
      'status': 'placed',
      'date': DateTime.now()
    });
    FirebaseFirestore.instance.collection('user').doc(uid).update({
      'orders': (userdata.get('orders') + 1),
    });
    FirebaseFirestore.instance
        .collection('orders')
        .doc(uid + (userdata.get('orders') + 1).toString())
        .set({
      'itemids': itemids,
      'urls': urls,
      'sizes': sizes,
      'price&count': priceandcount,
      'totalamount': totalamount,
      'mod': mode,
      'status': 'placed',
      'date': DateTime.now()
    });
    return {'status': 'success'};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}

Future<Map<String, dynamic>> removeorder(String orderid) async {
  DocumentSnapshot<Map<String, dynamic>> userdata = await FirebaseFirestore
      .instance
      .collection('user')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get();
  try {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('orders')
        .doc(orderid)
        .delete();
    await FirebaseFirestore.instance.collection('orders').doc(orderid).delete();
    FirebaseFirestore.instance
        .collection('user')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      'orders': (userdata.get('orders') + 1),
    });
    return {'status': 'success'};
  } on FirebaseException catch (e) {
    return {'status': e.message};
  }
}
