import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:partsbay/add_data/add_user.dart';

FirebaseAuth auth = FirebaseAuth.instance;
//change sign is a stream for knowing if the user is signed in or not
Stream<User?> changesign = auth.authStateChanges();

Future<Map<String, String>> signinemail(String email, String password) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: password);
    return {"status": "success"};
  } on FirebaseAuthException catch (e) {
    print(e.toString());

    return {"status": e.toString()};
  }
}

//function for logout
void signout() async {
  auth.signOut();
  print("Signed out");
}

//to register a new user
Future<Map<String, String>> register(String email, String password) async {
  try {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email, password: password);

    createuserprofile(userCredential.user!.uid, email);
    return {"status": "success"};
  } on FirebaseAuthException catch (e) {
    print(e.toString());
    return {"status": e.toString()};
  }
}

//resetting password
Future<Map<String, String>> sendpassreset(String email) async {
  try {
    await auth.sendPasswordResetEmail(email: email);
    return {"status": "success"};
  } on FirebaseException catch (e) {
    print(e.toString());
    return {"status": e.toString()};
  }
}

//tochange password
void changepass(String email, String oldpass, String newpass) async {
  try {
    await auth.signInWithEmailAndPassword(email: email, password: oldpass);
    await auth.currentUser!.updatePassword(newpass);
  } on FirebaseException catch (e) {
    print(e.toString());
  }
}
