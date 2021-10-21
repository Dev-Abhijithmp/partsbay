import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:partsbay/add_data/add_user.dart';

FirebaseAuth auth = FirebaseAuth.instance;
Stream<User?> changesign = auth.authStateChanges();

void signinemail(String email, String password) async {
  try {
    UserCredential userCredential =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    print(userCredential.toString());
  } on FirebaseException catch (e) {
    print(e.toString());
  }
}

void signout() async {
  auth.signOut();
  print("Signed out");
}

void register(String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    print('worked');
    createuserprofile(userCredential.user!.uid, email);
  } on FirebaseException catch (e) {
    print(e.toString());
  }
}

void sendpassreset(String email) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
  } on FirebaseApp catch (e) {
    print(e.toString());
  }
}
