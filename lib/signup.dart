import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';
import 'package:sanshipt/home.dart';
import 'package:sanshipt/signin.dart';
class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
                            Color(0xFFffffff).withOpacity(0.1),
                            Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFFffffff).withOpacity(0.5),
                          Color((0xFFFFFFFF)).withOpacity(0.5),
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
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                  hintStyle: TextStyle(color: Colors.white),
                                  prefixIcon: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: TextField(
                                style: TextStyle(color: Colors.white),
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: "Password",
                                  hintStyle: TextStyle(color: Colors.white),
                                  fillColor: Colors.white,
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.white,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        width: 3, color: Colors.greenAccent),
                                    borderRadius: BorderRadius.circular(40.0),
                                  ),
                                ),
                              ),
                            ),
                            alignment: Alignment.center,
                          ),
                          Container(
                            width: 100,
                            child: ElevatedButton(
                              onPressed: () {Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const Home()),
                                    );},
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
                              child: Text(
                                'Sign up',
                                style: TextStyle(color: Colors.blue),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
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
                                    ;
                                  },
                                  child: Text("Sign in",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "OR",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Sign in with",
                            style: TextStyle(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            "https://github.githubassets.com/images/modules/logos_page/GitHub-Mark.png"),
                                      )),
                                  TextButton(
                                      onPressed: () {},
                                      child: CircleAvatar(
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