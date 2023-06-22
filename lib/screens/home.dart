import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:http/http.dart' as http;

import '../resources/sanshipt_api.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void signout() async {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
    // await FirebaseAuth.instance.signOut();
  }

  Future<void> sendLongText(String input_text) async {
    String url = apiUrl;
    print('res start');
    final response = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        // body: {}
        body: jsonEncode({
          'input_text': input_text,
          'model': 'T5',
          'min_length': 40,
          'max_length': 80,
          //input_type: 'text' or 'url'
          'input_type': 'url',
        }));
    print('${jsonDecode(response.body)['output_text']}');
    print('res end');
  }

  void slt(String s) async {
    sendLongText(s);
  }

  Widget build(BuildContext context) {
    String s = "https://www.indiatoday.in/technology/news/story/twitter-vs-india-jack-dorsey-elon-musk-disagree-on-many-things-but-seemingly-agree-on-india-2392589-2023-06-13";
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
              child: const Text('Log Out'),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
              child: ElevatedButton(
                onPressed: () => slt(s),
                child: const Text('Send'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
