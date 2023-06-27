import 'package:sanshipt/providers/user_provider.dart';
// import 'package:sanshipt/screens/feedScreen.dart';
// import 'package:sanshipt/screens/uploadStuff.dart';
import 'package:sanshipt/models/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/screens/home.dart';
import 'package:sanshipt/screens/signup.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController;
  // String username = "";

  @override
  void initState() {
    super.initState();
    // getUsername();
    pageController = PageController();
  }

  // void getUsername() async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('users')
  //       .doc(FirebaseAuth.instance.currentUser?.uid)
  //       .get();
  //   print(snap);
  //   setState(() {
  //     username = (snap.data() as Map<String, dynamic>)!['username'];
  //   });
  //   print(username);
  //   print("&&&&&&&&&&&&&&&&&&&");
  // }

  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    // model.User user = Provider.of(context)<UserProvider>(context).getUser();
    return const Scaffold(
      body: Material(
        child: Center(
          child: Home(),
        ),
      ),
    );
  }
}
