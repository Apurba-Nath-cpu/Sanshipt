import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/screens/signup.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override

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
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 131, 198, 156),
       // appBar: AppBar(elevation: 0, automaticallyImplyLeading: false, title: Center(child: Text("Profile",style: TextStyle(fontSize: 30,),),),backgroundColor: Colors.transparent,),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // SizedBox(
                //   height: 50,
                // ),
                Text("Profile",style: TextStyle(fontSize: 30,color: Colors.white),),
                SizedBox(height: 50,),
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXTL070i2nDW-Juwu6h1MYRZDEkqvnFLlThg&usqp=CAU"),
                ),
                SizedBox(
                  height: 50,
                ),
                Text(
                  "tiwari.ravikant2001@gmail.com",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 40,
                ),
                // user name
                SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        TextField(
                          onChanged: (val) {
                            setState(() {
                              // email = val;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12)),
                            label: Text("username"),
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Colors.brown,
                            
                            //  contentPadding: EdgeInsets.all(20),
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                              //<-- SEE HERE
                              borderSide: BorderSide(
                                
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        // e-mail id
                        // TextField(
                        //   onChanged: (val) {
                        //     setState(() {
                        //       // email = val;
                        //     });
                        //   },
                        //   decoration: InputDecoration(
                        //     border: OutlineInputBorder(
                        //         borderRadius: BorderRadius.circular(12)),
                        //     label: Text("About"),
                        //     prefixIcon: Icon(Icons.person),
                        //     prefixIconColor: Colors.blue,
                        //     //  contentPadding: EdgeInsets.all(20),
                        //     labelStyle: TextStyle(color: Colors.grey),
                        //     enabledBorder: OutlineInputBorder(
                        //       borderRadius: BorderRadius.circular(20),

                        //       //<-- SEE HERE
                        //       borderSide: BorderSide(
                        //         color: Colors.blueGrey,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(height: 20,),
                        FloatingActionButton.extended(
                          elevation: 0.5,
                          backgroundColor: Colors.grey,
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
                                      Navigator.of(context).pop();
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
                          icon: Icon(Icons.logout),
                          label: Text("Logout"),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}
