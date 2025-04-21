import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// Register user with email and password
  Future<UserCredential?> register(
      String email, String password, String phone) async {
    try {
      // Create user with email and password
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Add user data to Firestore after registration
      await _firestore.collection('users').doc(userCredential.user!.uid).set({
        'email': email,
        'phone': phone,
        'fullName': '',
        'phoneNumber': phone,
        'createdAt': Timestamp.now(),
      });

      return userCredential;
    } catch (e) {
      Fluttertoast.showToast(msg: "Error: $e");
      return null;
    }
  }

  // Update user profile (full name, phone number)
  Future<void> updateUserProfile(String name, String phone) async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await _firestore.collection('users').doc(user.uid).update({
        'fullName': name,
        'phoneNumber': phone,
      });
    }
  }

  /// Login with Email & Password
  // Login with Email & Password
  Future<UserCredential?> login(String email, String password) async {
    try {
      // Try logging in the user
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );


      return userCredential;
    } on FirebaseAuthException catch (e) {
      String errorMessage = "Login Failed";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else {
        errorMessage = 'Login Failed: ${e.message}';
      }
      Fluttertoast.showToast(msg: errorMessage);
      return null;
    } catch (e) {
      Fluttertoast.showToast(msg: "Unexpected error: $e");
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      Fluttertoast.showToast(msg: "Signed Out Successfully!");
    } catch (e) {
      Fluttertoast.showToast(msg: "Sign-out Failed: ${e.toString()}");
    }
  }
}
