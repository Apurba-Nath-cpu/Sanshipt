import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/resources/auth_methods.dart';
import 'package:sanshipt/screens/history.dart';
import 'package:sanshipt/screens/input.dart';
import 'package:sanshipt/screens/profile.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:sanshipt/screens/summaryy.dart';
import 'package:sanshipt/models/user.dart' as model;
import 'package:firebase_auth/firebase_auth.dart';
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
    // final model.User? user = Provider.of<UserProvider>(context).getUser;
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
            resizeToAvoidBottomInset: false,
            body: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      color: const Color.fromARGB(255, 79, 158, 160),
                      height: 300,
                      width: double.infinity,
                    ),
                  ],
                ),
                Positioned(
                  top: 50,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        height: 80,
                        width: double.infinity,
                        color: const Color.fromARGB(255, 255, 122, 123),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const CircleAvatar(
                              radius: 0,
                            ),
                            Text(
                              'Sanshipt',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const Signup()));
                                  logout();
                                },
                                child: const Icon(
                                  Icons.logout,
                                  color: Colors.white,
                                ))
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 2.0,
                            ),
                          ],
                          color: Colors.white,
                        ),
                        height: 400,
                        width: 300,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 50),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Summarizer',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Color.fromARGB(255, 120, 172, 177),
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Text(
                                'Choose what you want to summarize...',
                                style: GoogleFonts.montserrat(
                                  textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          print("raw text tap...");
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Input(
                                                      input_type: "text",
                                                    )),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.edit_document,
                                          size: 50,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Raw text',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Spacer(),
                                  Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Input(
                                                      input_type: "url",
                                                    )),
                                          );
                                        },
                                        child: const Icon(
                                          Icons.link,
                                          size: 50,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        'Article',
                                        style: GoogleFonts.montserrat(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                      Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color.fromARGB(
                                  255, 86, 166, 167), // Background color
                            ),
                            onPressed: () async {
                              if (kDebugMode) {
                                print("isme aya h");
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const History()),
                              );
                              // await FirebaseAuth.instance.signOut();
                              // Navigator.pushReplacement(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => const Signup(),
                              //   ),
                              // );
                              // void signout() async {

                              //     }
                            },
                            child: Text(
                              'View saved summaries',
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
