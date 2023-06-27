import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sanshipt/models/user.dart' as model;
import 'package:sanshipt/resources/storage_methods.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sanshipt/utils/utils.dart';
// import 'package:ebook_reader/resources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<model.User> getUserDetails() async {
    User? currentUser = _auth.currentUser;

    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser?.uid).get();

    return model.User.fromSnap(snap);
  }

  Future<String> updateUserName(String newDisplayName) async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      // Update the display name in Firebase Auth
      await currentUser.updateDisplayName(newDisplayName);

      // Also update the display name in Firestore if you store user data there
      await FirebaseFirestore.instance
          .collection('users')
          .doc(currentUser?.uid)
          .update({'username': newDisplayName});
      return "Edited";
    } else {
      return "Please log in first";
    }
  }


  // sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required Uint8List file,
  }) async {
    String res = "Some error occured";
    try {
      if (email.isNotEmpty &&
          password.isNotEmpty &&
          username.isNotEmpty &&
          file != null) {
        print("In-if");
        print('${email}');
        // email = 'test3@gmail.com';
        print('${email}');
        // register user
        UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Registered");

        print(cred.user?.uid);
        print("Mid-if");

        String photoUrl = await StorageMethods()
            .uploadImageTostorage('profilePics', file, false);
        print('Mid-2');

        // add user to our database

        model.User user = model.User(
          username: username,
          uid: cred.user!.uid,
          email: email,
          photoUrl: photoUrl,
        );

        await _firestore
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson());
        print("Out-if");
        // await _firestore.collection('users').add({
        //   'username': username,
        //   'uid': cred.user!.uid,
        //   'email': email,
        //   // 'bio': bio,
        //   // 'followers': [],
        //   // 'following': [],
        //   'photoUrl': file,
        // });

        res = "success";
      }
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // logging user

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "Some error occurred";

    print('${email}');
    String email2 = 'test3@gmail.com';
    if(email == email2){
      print('equal');
    }
    print('${email}');

    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        res = "success";
      } else {
        res = "Please enter all the fields";
      }
    }
    // on FirebaseAuthException catch (err){
    //   if(err.code == 'user-not-found'){
    //
    //   }
    // }
    catch (err) {
      res = err.toString();
    }
    print(res);
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}
