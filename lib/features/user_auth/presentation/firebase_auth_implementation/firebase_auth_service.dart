import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isCoolingDown = false;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;
      if (user != null && !user.emailVerified) {
        try {
          await user.sendEmailVerification();
          showToast(
              message: 'Registration successful! Please verify your email.');
        } catch (e) {
          showToast(
              message: 'Unable to send verification email. Try again later.');
        }
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        showToast(message: 'This email is already registered.');
      } else if (e.code == 'too-many-requests') {
        showToast(
            message: 'Too many requests. Please wait a moment and try again.');
      } else {
        showToast(message: 'Error: ${e.message}');
      }
    } catch (e) {
      showToast(message: 'An unexpected error occurred: $e');
    }
    return null;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    if (isCoolingDown) {
      showToast(message: 'Please wait before trying again.');
      return null;
    }

    try {
      isCoolingDown = true;

      UserCredential credential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = credential.user;

      if (user != null) {
        if (!user.emailVerified) {
          showToast(
              message:
                  'Email not verified. Please check your inbox to verify.');
          return null;
        }
        return user;
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        showToast(message: 'Invalid email or password.');
      } else if (e.code == 'too-many-requests') {
        showToast(
            message: 'Too many requests. Please wait a moment and try again.');
      } else {
        showToast(message: 'Error: ${e.message}');
      }
    } catch (e) {
      showToast(message: 'An unexpected error occurred: $e');
    } finally {
      Future.delayed(Duration(seconds: 5), () {
        isCoolingDown = false;
      });
    }
    return null;
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
      showToast(message: 'Successfully signed out.');
    } catch (e) {
      showToast(message: 'Error signing out: $e');
    }
  }
}

void showToast({required String message}) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    backgroundColor: Color(0xFF2296F3),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
