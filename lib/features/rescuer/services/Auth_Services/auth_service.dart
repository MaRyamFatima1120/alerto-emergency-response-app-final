import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken,
        );
        await _auth.signInWithCredential(credential);
      }
    } catch (e) {

      print("Error:$e");
    }
  }

  Future<void> googleSignOut() async {
    try {
      await _auth.signOut(); //Firebase Sign Out
      await GoogleSignIn().signOut(); // Google Sign Out

      Fluttertoast.showToast(msg: "Signed Out Successfully!");
    } catch (e) {
      Fluttertoast.showToast(msg: "Sign-out Failed: ${e.toString()}");
    }
  }
}
