import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanshipt/utils/utils.dart';
import 'package:file_saver/file_saver.dart';

class Show extends StatefulWidget {
  String postId;
  String title;
  String content;
  DateTime publishedDate;
  Show(
      {Key? key,
      required this.postId,
      required this.title,
      required this.content,
      required this.publishedDate})
      : super(key: key);

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  var summaryData = {};
  String summaryTitle = "";
  String summaryContent = "";
  // DateTime publishedDate = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSummaryData();
  }

  void getSummaryData() async {
    try {
      // var summarySnap = await FirebaseFirestore.instance
      //     .collection('posts')
      //     .doc(widget.postId)
      //     .get();
      //
      // summaryData = summarySnap.data()!;
      // print("..getSummaryData..");
      // summaryTitle = summaryData['title'];
      // print(summaryTitle);
      // print(summaryData['title']);
      // summaryContent = summaryData['content'];
    } catch (e) {
      showSnackBar("Error loading summary info.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  color: Color.fromARGB(255, 79, 158, 160),
                  height: 500,
                  width: double.infinity,
                ),
                Expanded(
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                  ),
                )
              ],
            ),
            Positioned(
              top: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: Text(
                        'Sanshipt',
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                    ),
                    height: 80,
                    width: double.infinity,
                    color: const Color.fromARGB(255, 255, 122, 123),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2.0,
                        ),
                      ],
                      color: Colors.white,
                    ),
                    height: 500,
                    width: 300,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                      child: SelectableText(
                        widget.content,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w200),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(
                              255, 86, 166, 167), // Background color
                        ),
                        onPressed: () {
                          final snackBar = SnackBar(
                            duration: Duration(milliseconds: 200),
                            backgroundColor: Color.fromARGB(255, 79, 158, 160),
                            content: Center(child: Text('Text copied')),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          // Navigator.pop(context);
                          Clipboard.setData(
                              ClipboardData(text: widget.content));
                        },
                        child: Text(
                          'Copy summary',
                          style: GoogleFonts.poppins(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
