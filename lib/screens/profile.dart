import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/screens/signup.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:sanshipt/models/user.dart' as model;

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

  @override
  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 131, 198, 156),
        // appBar: AppBar(elevation: 0, automaticallyImplyLeading: false, title: Center(child: Text("Profile",style: TextStyle(fontSize: 30,),),),backgroundColor: Colors.transparent,),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: SingleChildScrollView(
              child: Column(children: [
                // SizedBox(
                //   height: 50,
                // ),
                const Text(
                  "Profile",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
                const SizedBox(
                  height: 50,
                ),
                // GestureDetector(
                //   onTap: () {
                //     print("dp");
                //     showDialog(
                //         context: context,
                //         builder: (_) => SimpleDialog(
                //           children: [
                //             Container(
                //               height: 350,
                //               width: 100,
                //               child: Image(
                //                 image: NetworkImage(
                //                   user?.photoUrl ??
                //                       "https://th.bing.com/th/id/OIP.mqCSNfJntVSLuyZoWOvrlwHaE8?w=273&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                //                 ),
                //               ),
                //             )
                //           ],
                //       ),
                //     );
                //   },
                //   child: CircleAvatar(
                //     radius: 80,
                //     backgroundImage: NetworkImage(
                //       user?.photoUrl ??
                //       "https://th.bing.com/th/id/OIP.mqCSNfJntVSLuyZoWOvrlwHaE8?w=273&h=182&c=7&r=0&o=5&dpr=1.3&pid=1.7",
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  user?.email ?? "",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 40,
                ),
                // user name
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20),
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
                              borderRadius: BorderRadius.circular(12),
                            ),
                            // label: Center(
                            //   child: Text(
                            //     user?.username ?? "",
                            //   ),
                            // ),
                            prefixIcon: const Icon(Icons.person),
                            prefixIconColor: Colors.brown,

                            //  contentPadding: EdgeInsets.all(20),
                            labelStyle: const TextStyle(color: Colors.white),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),

                              //<-- SEE HERE
                              borderSide: const BorderSide(
                                color: Colors.blueGrey,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
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
                        const SizedBox(
                          height: 20,
                        ),

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
                          icon: const Icon(Icons.logout),
                          label: const Text("Logout"),
                        )
                      ]),
                    ),
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
