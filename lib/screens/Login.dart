import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';

import '../resources/auth_methods.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

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

  void signUpUser() async {
    //
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
    if (res != 'success') {
      // showSnackBar(res, context);
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => Home(
            // uid: user!.uid,
          ),
        ),
      );
      // Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (context) => const ResponsiveLayout(
      //         webScreenLayout: WebScreenLayout(),
      //         mobileScreenLayout: MobileScreenLayout(),
      //       ),
      //     )
      // );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void signupUser2() async {
    print('${_emailController.text},' + '${_passwordController.text}');
    FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text
    );
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
                    margin: EdgeInsets.all(50),
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

                          Container(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
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
                              padding: const EdgeInsets.all(30.0),
                              child: TextField(
                                controller: _passwordController,
                                style: TextStyle(color: Colors.white),
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
                              onPressed: () => signupUser2(),
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
                              child: const Text(
                                'Sign up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
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
        )
    );
  }
}
