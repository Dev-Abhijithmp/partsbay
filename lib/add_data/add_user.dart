import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    'total': 0.0,
  });
}

Future<void> addtocart(context, String uid, String id, String url, double price,
    String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc(id.toString()).get();

  if (countdata.exists == false) {
    await documentReference.collection('cart').doc(id).set({
      'id': id,
      'count': 1,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size
    });
  } else {
    await documentReference
        .collection('cart')
        .doc(id.toString())
        .update({'count': (countdata.get('count') + 1)});
  }
}

Future<void> addtowhishlist(context, String uid, String id, String url,
    double price, String description, String title, String size) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('whishlist').doc(id).get();

  if (countdata.exists == false) {
    await documentReference.collection('whishlist').doc(id).set({
      'id': id,
      'title': title,
      'description': description,
      'url': url,
      'price': price,
      'size': size
    });
  } else {
    await documentReference
        .collection('cart')
        .doc(id)
        .update({'count': (countdata.get('count') + 1)});
  }
}

Future<void> subtractcount(String uid, String id) async {
  DocumentReference documentReference = user.doc(uid);
  DocumentSnapshot<Map<String, dynamic>>? countdata =
      await documentReference.collection('cart').doc(id).get();
  if (countdata['count'] > 1) {
    await documentReference
        .collection('cart')
        .doc(id)
        .update({'count': (countdata.get('count') - 1)});
  } else {
    removefromcart(uid, id);
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
Future<void> addtototal(double price, int count) async {
  DocumentReference documentReference =
      user.doc(FirebaseAuth.instance.currentUser!.uid);
  DocumentSnapshot<Object?> total = await documentReference.get();
  print(total);
}
