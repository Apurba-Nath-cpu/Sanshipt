import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void signout() async {
    FirebaseAuth.instance.signOut();
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            const Center(child: Text("Welcome to home page")),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => signout(),
              child: Text('Log Out'),
            ),
          ],
        ),
      ),
    );
  }
}
