import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:shop_app/failure.dart';
import 'package:shop_app/screens/home/home_screen.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  hostedDomain: 'pilani.bits-pilani.ac.in',
);
final FirebaseAuth auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');

Future<dynamic> signInWithGoogle(BuildContext context) async {
  final FirebaseAuth firebaseauth = FirebaseAuth.instance;
  GoogleSignInAccount account;
  try {
    account = await _googleSignIn.signIn();
    if (account == null)
      throw Failure('Sigin was aborted');
    else {
      GoogleSignInAuthentication auth = await account.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: auth.accessToken,
        idToken: auth.idToken,
      );

      final UserCredential userCredential =
          await firebaseauth.signInWithCredential(credential);

      final User user = userCredential.user;

      var userData = {
        'name': account.displayName,
        'provider': 'google',
        'PhotoUrl': account.photoUrl,
        'email': account.email
      };
      users.doc(user.uid).get().then((doc) {
        if (doc.exists) {
          // old user
          doc.reference.update(userData);
          // print(account.email);
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        } else {
          // new user
          users.doc(user.uid).set(userData);
          // print(account.email);

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
          );
        }
      });
    }
  } on PlatformException catch (error) {
    if (error.code == 'network_error')
      throw Failure('Not connected to internet');
  } catch (unexpectedError) {
    await _googleSignIn.signOut();
    throw Failure('An unexpected error has occoured ($unexpectedError)');
  }
}

void signout() async {
  await auth.signOut();
  await _googleSignIn.signOut();
}
