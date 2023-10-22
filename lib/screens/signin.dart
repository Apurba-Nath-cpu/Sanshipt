import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:sanshipt/screens/home.dart';
import 'package:sanshipt/screens/signup.dart';

import '../resources/auth_methods.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/responsive_layout.dart';
import '../responsive/web_screen_layout.dart';

void main() {
  runApp(const MaterialApp(home: Signin()));
}

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void signinUser() async {
    print(_emailController.text);
    print("..email..");
    setState(() {
      _isLoading = true;
    });
    print('in-login');
    String res = await AuthMethods().loginUser(
      email: _emailController.text.trim(),
      password: _passwordController.text,
    );
    if (res != 'success') {
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
      Navigator.pop(context);
      var snackBar = SnackBar(
        content: Center(
            child: Text(
          res,
          style: TextStyle(color: Colors.green),
        )),
        backgroundColor: Colors.white,
      );
      // Step 3
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 86, 166, 167),
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
                          'Welcome',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Log into your account',
                          style: GoogleFonts.lato(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        Center(
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: 10, vertical: 50),
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
                                  decoration: InputDecoration(
                                    hintText: "E-mail",
                                    hintStyle: const TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w500),
                                    prefixIcon: const Icon(
                                      Icons.email,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                TextField(
                                  controller: _passwordController,
                                  style: const TextStyle(color: Colors.black),
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    hintText: "Password",
                                    hintStyle: const TextStyle(color: Colors.grey),
                                    fillColor: Colors.white,
                                    prefixIcon: const Icon(
                                      Icons.key,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () => signinUser(),
                                  child: Text("Signin"),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 122, 123) // Background color
                                      ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'New user ? ',
                              style: GoogleFonts.lato(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                ' Signup',
                                style: GoogleFonts.lato(
                                  textStyle: TextStyle(
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
                  ],
                )
                ),
                _isLoading
                ? Center(
                    child: CircularProgressIndicator(
                        color: Color.fromARGB(255, 255, 122, 123)))
                : Container()
          ],
        ),
      ),
    );
  }
}
