import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
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
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.all(10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
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
                          onPressed: () {},
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
