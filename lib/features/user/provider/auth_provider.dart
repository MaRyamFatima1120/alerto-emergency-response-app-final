/*
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import '../../../core/utils/snackbar_helper.dart';
import '../services/Auth_Services/firebase_auth_service.dart';


class AuthProvider extends ChangeNotifier {
  final FirebaseAuthService _firebaseAuthService = FirebaseAuthService();

  bool _loading = false;
  bool get loading => _loading;

  // Email signup
  Future<void> handlerSignup(BuildContext context, String email, String password, String fullName, String phone) async {
    _setLoading(true);
    try {
      await _firebaseAuthService.register(email, password, phone);
      await _firebaseAuthService.updateUserProfile(fullName, phone);
      _setLoading(false);
      CustomSnackBar.toastMessage("Signup Successfully!!! Please Login ", context);
      context.push("/login");
    } on FirebaseAuthException catch (e) {
      _setLoading(false);
      String errorMessage = "Signup Failed";
      if (e.code == 'email-already-in-use') {
        errorMessage = 'This email is already in use.';
      }
      CustomSnackBar.toastMessage(errorMessage, context);
      context.push("/register");
    } catch (e) {
      _setLoading(false);
      CustomSnackBar.toastMessage("An unexpected error occurred during signup: $e", context);
    }
  }

  // Email login
  Future<void> handlerLogin(BuildContext context, String email, String password) async {
    _setLoading(true); // Show loading indicator

    try {
      // Attempt login with provided email and password
      UserCredential? userCredential = await _firebaseAuthService.login(email, password);

      if (userCredential != null) {
        _setLoading(false);

        // Show a success toast
        CustomSnackBar.toastMessage("Successfully Logged In", context);

        // Navigate to the next page only after successful login
        context.push('/mainPage'); // Navigate to the main page after login
      } else {
        _setLoading(false);
        CustomSnackBar.toastMessage("Invalid login credentials", context);
      }
    } on FirebaseAuthException catch (e) {
      _setLoading(false); // Hide loading indicator

      // Handle specific errors during login
      String errorMessage = "Login Failed";
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      } else if (e.code == 'invalid-credential') {
        errorMessage = 'The supplied auth credential is incorrect, malformed or has expired.';
      }
      // Show the error message and ensure we don't navigate to another page
      CustomSnackBar.toastMessage(errorMessage, context);
    } catch (e) {
      _setLoading(false); // Hide loading indicator
      CustomSnackBar.toastMessage("An unexpected error occurred during login: $e", context);
    }
  }



  // Set loading state
  void _setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
}
*/
