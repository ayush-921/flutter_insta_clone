import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup
  Future<String> signUpuser({
    required String email,
    required String uname,
    required String password,
    required String bio,
    //required Uint8List file,
  }) async {
    String res = "Some error occured ";
    try {
      if (email.isNotEmpty ||
          uname.isNotEmpty ||
          password.isNotEmpty ||
          bio.isNotEmpty) {
        //register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        //add user to database
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'bio': bio,
          'username': uname,
        });

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
