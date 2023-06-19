import 'package:flutter/material.dart';
import 'package:sanshipt/screens/show.dart';

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
      appBar: AppBar(
        elevation: 0,
        title: Center(child: Text("Saved summaries",style: TextStyle(color: Colors.black,fontWeight: FontWeight.w900),)),
         backgroundColor: Color.fromARGB(255, 131, 198, 156),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: 2,
        itemBuilder: (context, index) {
          return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const Show()),
            );
          },
          child: Container(
            margin: EdgeInsets.all(5),
            height: 80,
            child: Card(
              elevation: 3,
              color: Color.fromARGB(255, 131, 198, 156),
              // color: Colors.transparent,
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text("Sed ut perspiciatis unde omnis iste natus",style: TextStyle(color: Colors.white),)),
                  Spacer(),
                  // delete button to delete the summary from history storage
                  IconButton(onPressed: () {
                    
                  }, icon: Icon(Icons.delete,color: Colors.blueGrey,))
                ],
              ),
            ),
          ),
        );
        },
      )
    );
  }
}
