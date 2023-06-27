import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/resources/auth_methods.dart';
import 'package:sanshipt/screens/history.dart';
import 'package:sanshipt/screens/profile.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:sanshipt/screens/summaryy.dart';
import 'package:sanshipt/models/user.dart' as model;

import '../providers/user_provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  String input = ""; // get the input
  String input_type = "url"; // store the type text or url
  bool url_type = true; // show text field for url input
  bool text_type = false; // show text field for text input
  bool button = true; // show summarize button
  bool urlcol = true;
  bool textcol = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  void logout() async {
    print("..logout..");
    await AuthMethods().signOut();
  }

  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          FocusScopeNode currentFocus = FocusScope.of(context);

          if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
          }
        },
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 131, 198, 156),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                              print("Profile btn");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Profile(),
                                ),
                              );
                            },
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                            user?.photoUrl ??
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXTL070i2nDW-Juwu6h1MYRZDEkqvnFLlThg&usqp=CAU",
                          ),
                          child: Container(),
                          ),
                        ),
                        const Text(
                          'Sanshipt',
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: 30,
                              color: Colors.purple
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const History(),
                                ),
                              );
                            },
                            icon: const Icon(
                              Icons.history,
                              size: 30,
                            ),
                        ),

                        // TextButton(
                        //   onPressed: () {
                        //     showDialog(
                        //       context: context,
                        //       builder: (ctx) => AlertDialog(
                        //         title: const Text(""),
                        //         content: const Text("Do you want to log out?"),
                        //         actions: <Widget>[
                        //           TextButton(
                        //             onPressed: () {
                        //               signout();
                        //               Navigator.of(ctx).pop();
                        //             },
                        //             child: Container(
                        //               color: Colors.white,
                        //               padding: const EdgeInsets.all(14),
                        //               child: const Text("Yes"),
                        //             ),
                        //           ),
                        //         ],
                        //       ),
                        //     );
                        //   },
                        //   child: const Text(
                        //     'log out',
                        //     style: TextStyle(
                        //         fontSize: 20,
                        //         color: Colors.black,
                        //         fontWeight: FontWeight.w900),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  // Note: Same code is applied for the TextFormField as well

                  Container(
                    child: Column(
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      input = "";
                                      urlcol = true;
                                      textcol = false;
                                      url_type = true;
                                      text_type = false;
                                      button = true;
                                      input_type = "url";
                                    });
                                  },
                                  child: Container(
                                      height: 30,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: urlcol
                                              ? Colors.white
                                              : Colors.transparent,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: const Text(
                                        "Url",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w900,
                                            color: Colors.black87),
                                      ),
                                  ),
                              ),
                              //  Spacer(),
                              GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      input = "";
                                      urlcol = false;
                                      textcol = true;
                                      text_type = true;
                                      url_type = false;
                                      button = true;
                                      input_type = "text";
                                    });
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: textcol
                                            ? Colors.white
                                            : Colors.transparent,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: const Text(
                                      "Raw text",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w900,
                                          color: Colors.black87
                                      ),
                                    ),
                                  ),
                              ),
                            ],
                        ),
                        Visibility(
                          visible: text_type,
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(10, 20, 10, 20),
                            height: 500,
                            // decoration: BoxDecoration(border: Border.all()),
                            width: double.infinity,
                            padding: const EdgeInsets.all(10),
                            child: TextField(
                              style: const TextStyle(fontSize: 20),
                              cursorColor: Colors.black,
                              // cursorHeight: 20,
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              onChanged: (val) {
                                setState(() {
                                  input = val;
                                });
                              },
                              decoration: const InputDecoration(
                                hintText: "Enter your text here......",
                                hintStyle: TextStyle(fontSize: 20),
                                contentPadding: EdgeInsets.all(20),
                                border: InputBorder.none,
                                labelStyle:
                                    TextStyle(
                                        color: Colors.white,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        // url
                        Visibility(
                            visible: url_type,
                            child: Container(
                              margin: const EdgeInsets.fromLTRB(5, 120, 5, 50),
                              // decoration: BoxDecoration(border: Border.all()),
                              child: TextField(
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 20),
                                cursorColor: Colors.black,
                                keyboardType: TextInputType.multiline,
                                maxLines: 8,
                                onChanged: (val) {
                                  setState(() {
                                    input = val;
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Enter article url....",
                                  contentPadding: EdgeInsets.all(20),
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Visibility(
                          visible: button,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0, vertical: 20.0),
                                backgroundColor: Colors.teal,
                                shape: const StadiumBorder(),
                              ),
                              onPressed: () {
                                print(input);

                                print('hello');
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Summaryy(
                                          text: input, type: input_type
                                      ),
                                  ),
                                );
                                //input="";
                              },
                              child: const Text("Summarize"),
                          ),
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ),
         
        ),
      ),
    );
  }
}
