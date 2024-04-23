import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GoogleController {
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // Successfully signed in with Google
          print(user.displayName);
          // Navigate to the next screen or perform other actions
          Navigator.pushReplacementNamed(context, '/home'); // Example navigation
        } else {
          // Handle sign-in failure
          // Show error message or perform additional actions
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to sign in with Google')),
          );
        }
      } else {
        // Handle sign-in cancellation
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Google sign-in canceled')),
        );
      }
    } catch (e) {
      // Handle sign-in errors
      print('Google sign-in error: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error signing in with Google')),
      );
    }
  }
}