import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_insta_clone/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //signup
  Future<String> signUpuser({
    required String email,
    required String uname,
    required String password,
    required String bio,
    required Uint8List file,
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

        // check utils.dart upload profile pic in firebase storage and return the url address of photo
        String photoUrl = await StorageMethods()
            .uploadImageToStorage('profilePic', file, false);
        //add user to database
        await _firestore.collection('user').doc(cred.user!.uid).set({
          'uid': cred.user!.uid,
          'email': email,
          'followers': [],
          'following': [],
          'bio': bio,
          'username': uname,
          'photoUrl': photoUrl,
        });

        res = "success";
      }
    } catch (e) {
      res = e.toString();
    }
    return res;
  }
}
