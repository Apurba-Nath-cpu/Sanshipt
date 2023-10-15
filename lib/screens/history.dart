import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/screens/show.dart';
import 'package:sanshipt/models/user.dart' as model;
import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/utils.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {

  void deleteSummary(String postId) async {
    try {
      String res = "error";
      res = await FirestoreMethods().deletePost(
        postId : postId,
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(res),
        )
      );
      print('$res + LOLOLOL');
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 79, 150, 160),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
                'Saved Summaries',
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w800),
                ),
              ),
        ),
         backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: 900,
        child: StreamBuilder(
          builder: (context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState != ConnectionState.waiting) {
              return ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: snapshot.data?.docs.length,
                shrinkWrap: false,
                itemBuilder: (context, index) => snapshot.data!.docs[index].data()['uid'] == user?.uid ? Container(
                  margin: const EdgeInsets.all(10),
                  height: 80,
                  child: Card(
                    elevation: 3,
                    // color: Color.fromARGB(255, 255, 122, 123),
                    color: Colors.white,
                    // color: Colors.transparent,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        
                        GestureDetector(
                          onTap: () {
                            print(snapshot.data?.docs.length);
                            print("snapshot");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Show(
                                  postId: snapshot.data!.docs[index].data()['postId'],
                                  title: snapshot.data!.docs[index].data()['title'],
                                  content: snapshot.data!.docs[index].data()['content'],
                                  publishedDate: snapshot.data!.docs[index].data()['datePublished'].toDate(),
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: 300,
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Text(
                                  snapshot.data!.docs[index].data()['title'],
                                  style:  GoogleFonts.lato(
                                            textStyle:
                                                TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.w900)),
                                ),
                              ),
                          ),
                        ),
                        const Spacer(),
                        // delete button to delete the summary from history storage
                        GestureDetector(
                          onTap: () {

                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 12),
                            child: IconButton(
                              onPressed: () {
                                deleteSummary(snapshot.data!.docs[index].data()['postId']);
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ) :
               null
              );
            }
            return Center(child: CircularProgressIndicator(),);
          },
          stream: FirebaseFirestore.instance
              .collection('posts')
              .orderBy(
            'datePublished',
            descending: true,
          )
              .snapshots(),
        ),
      ),

      // ListView.builder(
      //   itemCount: 2,
      //   itemBuilder: (context, index) {
      //     return GestureDetector(
      //     onTap: () {
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => const Show()),
      //       );
      //     },
      //     child: Container(
      //       margin: const EdgeInsets.all(10),
      //       height: 80,
      //       child: Card(
      //         elevation: 3,
      //         color: const Color.fromARGB(255, 131, 198, 156),
      //         // color: Colors.transparent,
      //         child: Row(
      //           children: [
      //             const Padding(padding: EdgeInsets.all(20), child: Text("Sed ut perspiciatis unde omnis iste natus",style: TextStyle(color: Colors.white),)),
      //             const Spacer(),
      //             // delete button to delete the summary from history storage
      //             IconButton(
      //               onPressed: () {},
      //               icon: const Icon(
      //                 Icons.delete,
      //                 color: Colors.blueGrey,
      //               ),
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   );
      //   },
      // ),
    );
  }
}
