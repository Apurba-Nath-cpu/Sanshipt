import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';
import 'package:sanshipt/models/user.dart' as model;
import '../resources/firestore_methods.dart';
import '../resources/sanshipt_api.dart';
import '../utils/utils.dart';

class Summaryy extends StatefulWidget {
  String text;
  String type;

  Summaryy({super.key, required this.text, required this.type});

  @override
  State<Summaryy> createState() => _SummaryyState();
}

class _SummaryyState extends State<Summaryy> {
  @override
  bool show_save=true;
  bool isload = true;
  String summ = "dvbtgn";
  String title = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final List l = widget.text.split(' ');
    print(l.length);

    if (widget.text == '') {
      summ = "Cannot summarize empty text!!!";
      isload = false;
      show_save=false;
    } else if (l.length < 10 && widget.type == 'text') {
      summ = "Enter atleast 40 words";
      isload = false;
      show_save = false;
    } else {
      sendLongText(widget.text);
    }
  }

  Future<void> sendLongText(String input_text) async {
    print(widget.type);
    print(input_text);
    String url = apiUrl;
    print('res start');
    try {
      final response = await http.post(Uri.parse(url),
          headers: {'Content-Type': 'application/json'},
          // body: {}
          body: jsonEncode({
            'input_text': input_text,
            'model': 'T5',
            'min_length': 10,
            'max_length': 80,
            'input_type': widget.type,
            //'input_type': 'text',
          }));

      summ = ('${jsonDecode(response.body)['output_text']}');
      print(summ);
      setState(() {
        isload = false;
      });
    } catch (e) {
      summ = "Sorry could not summarize.";
      setState(() {
        isload = false;
        show_save = false;
      });
      print(summ);
      print(e);
    }

    print('res end');
  }

  void uploadSummary(
    String title,
    String summary,
    String uid,
    // String username
  ) async {
    print("save wale me aya hai");
    try {
      String res = "error";
      res = await FirestoreMethods().uploadPost(
        title: title,
        summary: summary,
        uid: uid,
        // username: username,
      );
      if (res == "success") {
        final snackBar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Color.fromARGB(255, 79, 158, 160),
          content: Center(child: Text('Summary saved')),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      } else {
        final snackBar = SnackBar(
          duration: Duration(milliseconds: 500),
          backgroundColor: Color.fromARGB(255, 79, 158, 160),
          content: Center(child: Text('Could not save summary')),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
      print('$res + LOLOLOL');
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: isload
              ? Container(
                color: Colors.white,
                  child: const Center(child: CircularProgressIndicator()))
              : Stack(
                  children: [
                    Column(
                      children: [
                        Container(
                          color: const Color.fromARGB(255, 79, 158, 160),
                          height: 300,
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
                            height: 80,
                            width: double.infinity,
                            color: const Color.fromARGB(255, 255, 122, 123),
                            child: Center(
                              child: Text(
                                'Summary',
                                style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  blurRadius: 2.0,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            height: 400,
                            width: 300,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: SelectableText(
                              summ,
                              style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w300),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          Container(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              height: 50,
                              width: double.infinity,
                              child: !show_save?null:ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255, 86, 166, 167), // Background color
                                ),
                                onPressed: () async {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible:
                                        true, // user must tap button!
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        backgroundColor: const Color.fromARGB(
                                            255, 79, 158, 160),
                                        title: Text(
                                          'Enter a title',
                                          style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 20,
                                                fontWeight: FontWeight.w200),
                                          ),
                                        ),
                                        content: TextField(
                                          onChanged: (value) {
                                            title = value;
                                          },
                                        ),
                                        actions: [
                                          TextButton(
                                            child: Text(
                                              'OK',
                                              style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 15,
                                                    fontWeight:
                                                        FontWeight.w200),
                                              ),
                                            ),
                                            onPressed: () {
                                              print(user);
                                              print(title);
                                              uploadSummary(
                                                title, summ,
                                                user!.uid,
                                                // user.username
                                              );
                                              Navigator.of(context).pop();
                                              // final snackBar = SnackBar(
                                              //         duration: Duration(
                                              //             milliseconds: 200),
                                              //         backgroundColor:
                                              //             Color.fromARGB(255,
                                              //                 79, 158, 160),
                                              //         content: Center(
                                              //             child: Text(
                                              //                 'Summary saved')),
                                              //       );
                                              //       ScaffoldMessenger.of(
                                              //               context)
                                              //           .showSnackBar(snackBar);
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                  print("ye hai title");
                                  print(title);
                                },
                                child: Text(
                                  'Save',
                                  style: GoogleFonts.poppins(
                                    textStyle: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              )
                              ),
                              SizedBox(height: 30,),
                              Container(
                              padding: EdgeInsets.symmetric(horizontal: 80),
                              height: 50,
                              width: double.infinity,
                              child: !show_save
                                  ? null
                                  : ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255,
                                            86,
                                            166,
                                            167), // Background color
                                      ),
                                      onPressed: (){
                                        Clipboard.setData(ClipboardData(text: summ));
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
                                    )
                                    ),
                        ],
                      ),
                    ),
                  ],
                )),
    );
  }
}
