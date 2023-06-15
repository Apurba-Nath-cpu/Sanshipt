import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:sanshipt/screens/summaryy.dart';
import 'fetch.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool isload=false;
  String paragraph = "";
  String url="";
  void signout() async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const Signup(),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
          backgroundColor: Color.fromARGB(255, 220, 202, 202),
          body: isload?Center(child: CircularProgressIndicator()):SingleChildScrollView(
            child: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXTL070i2nDW-Juwu6h1MYRZDEkqvnFLlThg&usqp=CAU"),
                          ),
                          (Text(
                            'Sanshipt',
                            style: TextStyle(
                                fontWeight: FontWeight.w900,
                                fontSize: 30,
                                color: Color.fromARGB(255, 0, 0, 0)),
                          )),
                          TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (ctx) => AlertDialog(
                                  title: const Text(""),
                                  content: const Text("Do you want to log out?"),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        signout();
                                        Navigator.of(ctx).pop();
                                      },
                                      child: Container(
                                        color: Colors.white,
                                        padding: const EdgeInsets.all(14),
                                        child: const Text("Yes"),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text(
                              'log out',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w900),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 150,
                    ),
                    // Note: Same code is applied for the TextFormField as well
                    SingleChildScrollView(
                      child: Container(
                        margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        height: 400,
                        decoration: BoxDecoration(border: Border.all()),
                        width: double.infinity,
                        padding: EdgeInsets.all(10),
                        child: TextField(
                          cursorColor: Colors.black,
                          cursorHeight: 20,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (val) {
                            setState(() {
                              paragraph = val;
                              
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Enter your text here......",
                            hintStyle: TextStyle(fontSize: 20),
                            contentPadding: EdgeInsets.all(20),
                            border: InputBorder.none,
                            labelStyle: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>  Summaryy(text:paragraph)),
                              );
                          
                          // setState(() async{
                          //   print("fdvfb");
                          //   // Within the `FirstRoute` widget
                           
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) =>  Summaryy(answer : decoded['output'])),
                          //     );
                          // });
                        },
                        child: Text("Summarize"))
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
