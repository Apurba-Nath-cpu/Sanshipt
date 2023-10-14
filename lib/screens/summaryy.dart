import 'dart:math';

import 'package:flutter/material.dart';
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
  bool isload = true;
  String summ = "";
  bool save = true;
  String title="";
  @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   final List l = widget.text.split(' ');
  //   print(l.length);

  //   if (widget.text == '') {
  //     summ = "Cannot summarize empty text!!!";
  //     isload = false;
  //     save = false;
  //   } else if (l.length < 10 && widget.type == 'text') {
  //     summ = "Enter atleast 40 words";
  //     isload = false;
  //     save = false;
  //   } else {
  //     sendLongText(widget.text);
  //   }
  // }

  // Future<void> sendLongText(String input_text) async {
  //   String url = apiUrl;
  //   print('res start');
  //   try {
  //     final response = await http.post(Uri.parse(url),
  //         headers: {'Content-Type': 'application/json'},
  //         // body: {}
  //         body: jsonEncode({
  //           'input_text': input_text,
  //           'model': 'T5',
  //           'min_length': 10,
  //           'max_length': 80,
  //           'input_type': widget.type,
  //           //'input_type': 'text',
  //         }));

  //     summ = ('${jsonDecode(response.body)['output_text']}');
  //     print(summ);
  //     setState(() {
  //       isload = false;
  //     });
  //   } catch (e) {
  //     summ = "Sorry could not summarize the given text.";
  //     setState(() {
  //       isload = false;
  //       save=false;
  //     });
  //     print(summ);
  //     print(e);
  //   }

  //   print('res end');
  // }

  // void uploadSummary(
  //     String title, String summary, String uid, String username) async {
  //   try {
  //     String res = "error";
  //     res = await FirestoreMethods().uploadPost(
  //       title: title,
  //       summary: summary,
  //       uid: uid,
  //       username: username,
  //     );
  //     // if (res == "success") {
  //     //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     //     content: Text("Posted"),
  //     //   ));
  //     // } else {
  //     //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
  //     //     content: Text("res"),
  //     //   ));
  //     // }
  //     print('$res + LOLOLOL');
  //   } catch (err) {
  //     showSnackBar(err.toString(), context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final model.User? user = Provider.of<UserProvider>(context).getUser;

    return GestureDetector(
      onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Color.fromARGB(255, 79, 158, 160),
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
                      child: Center(
                        child: Text(
                          'Summary',
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
                      height: 60,
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
                      height: 400,
                      width: 300,
                      padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
                      child: SelectableText('''The environment is everything that surrounds us, including the air we breathe, the water we drink, the land we live on, and all the living and non-living things that share our planet. It is essential for our survival and well-being, providing us with food, shelter, and other resources.

The environment is also home to a vast array of biodiversity, from the smallest microorganisms to the largest whales. This biodiversity plays a vital role in maintaining the balance of nature and ensuring the health of the planet.

However, human activities are having a devastating impact on the environment. We are polluting the air and water, destroying forests, and driving many species to extinction. This is causing climate change, which is already having a serious impact on people and ecosystems around the world.

It is clear that we need to take action to protect the environment. We need to reduce our reliance on fossil fuels, transition to renewable energy, and protect our forests and other natural areas. We also need to change our consumption habits and reduce our waste.

Protecting the environment is not just about saving the planet for future generations. It is also about ensuring our own health and well-being. A clean and healthy environment is essential for our physical and mental health.''')
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(
                                255, 86, 166, 167), // Background color
                          ),
                          onPressed: () {},
                          child: Text(
                            'Save',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
