import 'package:flutter/material.dart';
class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 198, 156),
      appBar: AppBar(title: Center(child: Text("Saved summaries")),backgroundColor: Colors.green,automaticallyImplyLeading: false,),
      body: ListView(children: [
        Container(
          margin: EdgeInsets.all(5),
          height: 80,
          child: Card(
           color: Colors.teal,
            child: Padding(padding: EdgeInsets.all(10), child: Text("hiwe")),
          ),
        ),
    
      ]),
    );
  }
}