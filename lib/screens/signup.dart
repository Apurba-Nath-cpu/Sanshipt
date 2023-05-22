import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:sanshipt/screens/home.dart';
import 'package:sanshipt/screens/signin.dart';
import 'package:image_picker/image_picker.dart';
import '../resources/auth_methods.dart';
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

  Uint8List? _image;
  bool _isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _bioController.dispose();
  }

  void selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
    setState(() {
      _image = im;
    });
  }

  void signupUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().signUpUser(
      email: _emailController.text,
      password: _passwordController.text,
      username: _usernameController.text,
      bio: _bioController.text,
      file: _image!,
    );
    print(res);
    print('looooooooool');
    if(res != 'success'){
      // showSnackBar(res, context);
    }
    else{
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(),
        ),
      );
    }
    setState(() {
      _isLoading = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[900],
        body: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(50),
                    height: 150,
                    width: 150,
                    child: Lottie.network(
                        'https://assets4.lottiefiles.com/private_files/lf30_YlODxz.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: GlassmorphicContainer(
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.1),
                            const Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0.5),
                          const Color((0xFFFFFFFF)).withOpacity(0.5),
                        ],
                      ),
                      blur: 20,
                      border: 2,
                      borderRadius: 20,
                      height: 500,
                      width: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //child: Image.network("https://cdn.analyticsvidhya.com/wp-content/uploads/2020/12/166651_5_t4EJl1Iy9B1w5EtX1Zog.jpeg")),
                          Material(
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height +
                                    MediaQuery.of(context).size.width),
                            child: InkWell(
                              onTap: () => selectImage(),
                              child: Container(
                                child: _image != null
                                    ? Material(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height +
                                          MediaQuery.of(context)
                                              .size
                                              .width),
                                  child: CircleAvatar(
                                    radius:
                                    MediaQuery.of(context).size.height *
                                        0.041,
                                    backgroundColor: Colors.greenAccent,
                                    child: CircleAvatar(
                                      radius: MediaQuery.of(context)
                                          .size
                                          .height *
                                          0.038,
                                      backgroundImage: MemoryImage(_image!),
                                    ),
                                  ),
                                )
                                    : Material(
                                  borderRadius: BorderRadius.circular(
                                      MediaQuery.of(context).size.height +
                                          MediaQuery.of(context)
                                              .size
                                              .width),
                                  child: CircleAvatar(
                                    radius:
                                    MediaQuery.of(context).size.height *
                                        0.041,
                                    backgroundImage: const AssetImage(
                                        'assets/null_dp.png'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                              child: TextField(
                                controller: _emailController,
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  prefixIcon: const Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                              child: TextField(
                                controller: _passwordController,
                                style: const TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: const TextStyle(color: Colors.white),
                                  fillColor: Colors.white,
                                  prefixIcon: const Icon(
                                    Icons.key,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () => signupUser(),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                    //side: BorderSide(width: 3, color: Colors.black),
                                  ),
                                ),
                              ),
                              child: _isLoading
                                  ? const Center(
                                    child: CircularProgressIndicator(
                                      color: Color.fromARGB(255, 0, 51, 76),
                                    ),
                                  )
                                  : const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Already signed up ? ",
                                style: TextStyle(color: Colors.white),
                              ),
                              GestureDetector(
                                  onTap: () {
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Signin()),
                                    );
                                  },
                                  child: const Text("Sign in",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)
                                  )
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "OR",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "Sign in with",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: const CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://play-lh.googleusercontent.com/6UgEjh8Xuts4nwdWzTnWH8QtLuHqRMUB7dp24JYVE2xcYzq4HA8hFfcAbU-R-PC_9uA1"),
                                      ))
                                ]),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}