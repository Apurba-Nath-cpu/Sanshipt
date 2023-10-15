import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sanshipt/screens/summaryy.dart';

class Input extends StatefulWidget {
  String input_type;
  Input({super.key,required this.input_type});

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  String text="";
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
                  child: Container(color: Colors.white,
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
                  SizedBox(height: 50,),
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
                      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                      child: TextField(
                        onChanged: (value) {
                          text=value;
                        },
                        style: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black)),
                        maxLines: null,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(border: InputBorder.none,hintText: "Enter your "+widget.input_type+" here",hintStyle: GoogleFonts.lato(textStyle: TextStyle(color: Colors.black))),
                      )
                    ),
                  ),
                  SizedBox(
                    height: 70,
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
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Summaryy(text: text,type:widget.input_type,)),
                          );
                        },
                        child: Text(
                          'Summarize',
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
            )
          ],
        ),
      ),
    );
  }
}