import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sanshipt/screens/home.dart';
import 'package:sanshipt/screens/signin.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/auth_methods.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../utils/utils.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void initState() {
    super.initState();
    //log('Entering full screen mode...');
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  bool is_loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  void signupUser() async {
    print('${_emailController.text}');
    String res = 'failure';
    res = await AuthMethods().signUpUser(
      email: _emailController.text.trim(),
      password: _passwordController.text,
      // username: _usernameController.text,
      // file: _image!,
    );
     setState(() {
      is_loading = false;
    });
    print(res);
    print('looooooooool');
    if (res != 'success') {
      print("not wale me ");
      print(res);
      var snackBar = SnackBar(
        content: Center(
            child: Text(
         res,
          style: TextStyle(color: Colors.red),
        )),
        backgroundColor: Colors.white,
      );
      // Step 3
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
       var snackBar = SnackBar(
        content: Center(
            child: Text(
          res,
          style: TextStyle(color:Colors.green),
        )),
        backgroundColor: Colors.white,
      );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // debugShowCheckedModeBanner: false,
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
            backgroundColor: const Color.fromARGB(255, 86, 166, 167),
            body: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Register',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Create a new account',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 50),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                          ),
                          height: 350,
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.black),
                                decoration: const InputDecoration(
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: _passwordController,
                                style: const TextStyle(color: Colors.black),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              TextField(
                                controller: _confirmPasswordController,
                                style: const TextStyle(color: Colors.black),
                                obscureText: true,
                                decoration: const InputDecoration(
                                  hintText: "Confirm Password",
                                  hintStyle: TextStyle(color: Colors.grey),
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    is_loading=true;
                                  });
                                  signupUser();
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 122, 123) // Background color
                                    ),
                                child: Text("Signup"),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account ? ',
                            style: GoogleFonts.lato(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Signin()),
                              );
                            },
                            child: Text(
                              ' Signin',
                              style: GoogleFonts.lato(
                                textStyle: const TextStyle(
                                    color: Color.fromARGB(255, 255, 122, 123),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                is_loading
                    ? Center(
                        child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 255, 122, 123)
                      ))
                    : Container()
              ],
            )
            ),

      ),
    );
  }
}
