import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserDao extends ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  bool _didCreateProfile = false;

  bool get didCreateProfile => _didCreateProfile;

  void profileClicked() {
    _didCreateProfile = true;
    notifyListeners();
  }

  bool isLoggedIn() {
    return _auth.currentUser != null;
  }

  String? userId() {
    return _auth.currentUser?.uid;
  }

  String? email() {
    return _auth.currentUser?.email;
  }

  Future<String?> signUpUser({
    required String email,
    required String password,
  }) async {
    String result = '';
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        result = 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        result = 'An account already exists for that email.';
      } else if (e.code == 'invalid-email') {
        result = 'Email is invalid.';
      } else {
        print(e);
      }
      return result;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  Future<String?> logInUser({
    required String email,
    required String password,
  }) async {
    String result = 'Error occurred';
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        result = 'Password is incorrect.';
      } else if (e.code == 'user-not-found') {
        result = 'User is not registered.';
      } else if (e.code == 'invalid-email') {
        result = 'Invalid email.';
      } else {
        print(e);
      }
      return result;
    } catch (e) {
      print(e);
      return e.toString();
    }
  }

  void logOutUser() async {
    _didCreateProfile = false;
    await _auth.signOut();
    notifyListeners();
  }
}
