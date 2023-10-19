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
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const ResponsiveLayout(
            webScreenLayout: WebScreenLayout(),
            mobileScreenLayout: MobileScreenLayout(),
          ),
        ),
      );
    }
    // else
    // {
    //   Navigator.of(context).pushReplacement(
    //      MaterialPageRoute(
    //      builder: (context) => const Home()));
    // }
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
        body: Padding(
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
                            // Container(
                            //   alignment: Alignment.center,
                            //   child: Padding(
                            //     padding:
                            //         const EdgeInsets.fromLTRB(30, 10, 30, 10),
                            //     child: TextField(
                            //       controller: _usernameController,
                            //       style: const TextStyle(color: Colors.black),
                            //       decoration: InputDecoration(
                            //         hintText: "Username",
                            //         hintStyle:
                            //             const TextStyle(color: Colors.grey),
                            //         prefixIcon: const Icon(
                            //           Icons.person,
                            //           color: Colors.grey,
                            //         ),
                            //         enabledBorder: OutlineInputBorder(
                            //           borderSide: const BorderSide(
                            //               width: 1, color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(40.0),
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Material(
                            //   borderRadius: BorderRadius.circular(40),
                            //   child: InkWell(
                            //     onTap: () => selectImage(),
                            //     child: Container(
                            //       child: _image != null
                            //           ? Material(
                            //               borderRadius:
                            //                   BorderRadius.circular(50),
                            //               child: CircleAvatar(
                            //                 radius: 40,
                            //                 backgroundColor: Colors.greenAccent,
                            //                 child: CircleAvatar(
                            //                   radius: 38,
                            //                   backgroundImage:
                            //                       MemoryImage(_image!),
                            //                 ),
                            //               ),
                            //             )
                            //           : Material(
                            //               borderRadius:
                            //                   BorderRadius.circular(50),
                            //               child: const CircleAvatar(
                            //                 radius: 40,
                            //                 backgroundImage: AssetImage(
                            //                     'assets/null_dp.png'),
                            //               ),
                            //             ),
                            //     ),
                            //   ),
                            // ),
                            ElevatedButton(
                              onPressed: () => signinUser(),
                              child: Text("Signin"),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Color.fromARGB(
                                      255, 255, 122, 123) // Background color
                                  ),
                            ),
                          ],
                        ),

                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //   children: [
                        //     //child: Image.network("https://cdn.analyticsvidhya.com/wp-content/uploads/2020/12/166651_5_t4EJl1Iy9B1w5EtX1Zog.jpeg")),
                        // Material(
                        //   borderRadius: BorderRadius.circular(40),
                        //   child: InkWell(
                        //     onTap: () => selectImage(),
                        //     child: Container(
                        //       child: _image != null
                        //           ? Material(
                        //               borderRadius: BorderRadius.circular(50),
                        //               child: CircleAvatar(
                        //                 radius: 40,
                        //                 backgroundColor: Colors.greenAccent,
                        //                 child: CircleAvatar(
                        //                   radius: 38,
                        //                   backgroundImage:
                        //                       MemoryImage(_image!),
                        //                 ),
                        //               ),
                        //             )
                        //           : Material(
                        //               borderRadius: BorderRadius.circular(50),
                        //               child: const CircleAvatar(
                        //                 radius: 40,
                        //                 backgroundImage: AssetImage(
                        //                     'assets/null_dp.png'),
                        //               ),
                        //             ),
                        //     ),
                        //   ),
                        // ),
                        //     Container(
                        //       alignment: Alignment.center,
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        // child: TextField(
                        //   controller: _emailController,
                        //   style: const TextStyle(color: Colors.black),
                        //   decoration: InputDecoration(
                        //     hintText: "E-mail",
                        //     hintStyle:
                        //         const TextStyle(color: Colors.grey,fontWeight: FontWeight.w500),
                        //     prefixIcon: const Icon(
                        //       Icons.email,
                        //       color: Colors.grey,
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(
                        //           width: 1, color: Colors.grey),
                        //       borderRadius: BorderRadius.circular(40.0),
                        //     ),
                        //   ),
                        // ),
                        //       ),
                        // ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   child: Padding(
                        //     padding:
                        //     const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        //     child: TextField(

                        //       controller: _usernameController,
                        //       style: const TextStyle(color: Colors.black),
                        //       decoration: InputDecoration(
                        //         hintText: "Username",
                        //         hintStyle:
                        //         const TextStyle(color: Colors.grey),
                        //         prefixIcon: const Icon(
                        //           Icons.person,
                        //           color: Colors.grey,
                        //         ),
                        //         enabledBorder: OutlineInputBorder(

                        //           borderSide: const BorderSide(

                        //               width: 1, color: Colors.grey),
                        //           borderRadius: BorderRadius.circular(40.0),
                        //         ),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //     Container(
                        //       alignment: Alignment.center,
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.fromLTRB(30, 10, 30, 10),
                        // child: TextField(
                        //   controller: _passwordController,
                        //   style: const TextStyle(color: Colors.black),
                        //   obscureText: true,
                        //   decoration: InputDecoration(
                        //     hintText: "Password",
                        //     hintStyle:
                        //         const TextStyle(color: Colors.grey),
                        //     fillColor: Colors.white,
                        //     prefixIcon: const Icon(
                        //       Icons.key,
                        //       color: Colors.grey,
                        //     ),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderSide: const BorderSide(
                        //           width: 1, color: Colors.grey),
                        //       borderRadius: BorderRadius.circular(40.0),
                        //     ),
                        //   ),
                        // ),
                        //       ),
                        //     ),
                        //     Container(
                        //       width: 100,
                        //       child: ElevatedButton(
                        //         onPressed: () => signupUser(),
                        //         style: ButtonStyle(
                        //           backgroundColor:
                        //               MaterialStateProperty.all<Color>(
                        //                   Colors.white),
                        //           shape: MaterialStateProperty.all(
                        //             RoundedRectangleBorder(
                        //               borderRadius: BorderRadius.circular(30.0),
                        //               //side: BorderSide(width: 3, color: Colors.black),
                        //             ),
                        //           ),
                        //         ),
                        //         child: _isLoading
                        //             ? const Center(
                        //                 child: CircularProgressIndicator(
                        //                   color: Color.fromARGB(255, 0, 51, 76),
                        //                 ),
                        //               )
                        //             : const Text(
                        //                 'Sign up',
                        //                 style: TextStyle(color: Colors.blue),
                        //               ),
                        //       ),
                        //     ),
                        //     const SizedBox(
                        //       height: 20,
                        //     ),
                        //     Row(
                        //       mainAxisAlignment: MainAxisAlignment.center,
                        //       children: [
                        //         const Text(
                        //           "Already signed up ? ",
                        //           style: TextStyle(color: Colors.white),
                        //         ),
                        //         GestureDetector(
                        //             onTap: () {
                        //               Navigator.pushReplacement(
                        //                 context,
                        //                 MaterialPageRoute(
                        //                     builder: (context) => const Signin()),
                        //               );
                        //             },
                        //             child: const Text("Sign in",
                        //                 style: TextStyle(
                        //                     color: Colors.white,
                        //                     fontWeight: FontWeight.bold))),
                        //       ],
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     const Text(
                        //       "OR",
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     const Text(
                        //       "Sign in with",
                        //       style: TextStyle(color: Colors.white),
                        //     ),
                        //     const SizedBox(
                        //       height: 10,
                        //     ),
                        //     Container(
                        //       child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.center,
                        //           children: [
                        //             TextButton(
                        //                 onPressed: () {},
                        //                 child: const CircleAvatar(
                        //                   backgroundImage: NetworkImage(
                        //                       "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
                        //                 )),
                        //             TextButton(
                        //                 onPressed: () {},
                        //                 child: const CircleAvatar(
                        //                   backgroundImage: NetworkImage(
                        //                       "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
                        //                 ))
                        //           ]),
                        //     )
                        //   ],
                        // ),
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
            )),
      ),
    );
  }
}
