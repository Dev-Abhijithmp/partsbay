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

Future<void> addtocart(context, String uid, String id, String url, double price,
    String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata = await documentReference
      .collection('cart')
      .doc((id + size).toString())
      .get();

  if (countdata.exists == false) {
    await documentReference.collection('cart').doc((id + size)).set({
      'id': id + size,
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
        .doc((id + size).toString())
        .update({'count': (countdata.get('count') + 1)});
    await documentReference
        .collection('cart')
        .doc((id + size).toString())
        .update({'total': ((countdata.get('count') + 1) * price)});
  }
}

Future<void> addtowhishlist(context, String uid, String id, String url,
    double price, String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('whishlist').doc(id + size).get();

  if (countdata.exists == false) {
    await documentReference.collection('whishlist').doc(id + size).set({
      'id': id + size,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size
    });
  } else {
    await documentReference
        .collection('cart')
        .doc((id + size))
        .update({'count': (countdata.get('count') + 1)});
  }
}

Future<void> subtractcount(String uid, String id, double price, size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc((id + size)).get();
  if (countdata['count'] > 1) {
    await documentReference
        .collection('cart')
        .doc((id + size))
        .update({'count': (countdata.get('count') - 1)});
    await documentReference
        .collection('cart')
        .doc(id)
        .update({'total': ((countdata.get('count') - 1) * price)});
  } else {
    removefromcart(uid, (id + size));
  }
}

Future<void> removefromcart(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  await documentReference.collection('cart').doc(id).delete();
}

Future<void> removefromwhishlist(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  documentReference.collection('whishlist').doc(id).delete();
}

//Provider.of<Change>(context).cartcount

Future<void> addorder(String uid) async {
  DocumentReference documentReference = user.doc(uid);
  QuerySnapshot<Map<String, dynamic>>? flag =
      await documentReference.collection('orders').get();
  if (flag == null) {
  } else {
    print(flag.docs.toString());
  }
}
