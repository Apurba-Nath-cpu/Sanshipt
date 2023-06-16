import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class Summaryy extends StatefulWidget {
  String text;
   Summaryy({super.key,required this.text});

  @override
  State<Summaryy> createState() => _SummaryyState();
}

class _SummaryyState extends State<Summaryy> {
  @override
  bool isload=true;
  String summ="";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sendLongText(widget.text);
    
  }
  Future<void> sendLongText(String input_text) async {
  String apiUrl = 'https://fast-api-vercel-wine.vercel.app/get_summary/';
    String url = apiUrl;
    print('res start');
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json'},
      // body: {}
      body: jsonEncode({
        'input_text': input_text,
        'model': 'T5',
        'min_length': 40,
        'max_length': 80
      })
    );
    summ=('${jsonDecode(response.body)['output_text']}');
    print(summ);
    setState(() {
      isload=false;
    });
    
    print('res end');
  }

  Widget build(BuildContext context) {
    return   Scaffold(
      backgroundColor: Color.fromARGB(255, 220, 202, 202),
      body:isload?Center(child: CircularProgressIndicator()):SafeArea(
        child: Container(
          child: Column(
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Container(
                  margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  height: 400,
                  decoration: BoxDecoration(border: Border.all()),
                  width: double.infinity,
                  padding: EdgeInsets.all(10),
                  child: Text(summ),
                ),
          ],),
        ),
      )
    );
    
  }
}