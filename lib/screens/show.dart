import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sanshipt/utils/utils.dart';

class Show extends StatefulWidget {
  final String postId;
  final String title;
  final String content;
  final DateTime publishedDate;
  const Show({
    Key? key,
    required this.postId,
    required this.title,
    required this.content,
    required this.publishedDate
  }) : super(key: key);

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
    try{
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

    }
    catch(e){
      showSnackBar("Error loading summary info.", context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 131, 198, 156),
         body: SingleChildScrollView(
           child: SafeArea(child:Padding(padding: const EdgeInsets.all(0),child: Column(children: [
            Container(
                  margin: const EdgeInsets.fromLTRB(30,30,30,0),
                  
                  height: 100,
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: 
                      [
                        // SizedBox(height: 50,),
                        Column(
                          children: [
                            const Text("Title",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.blue),),
                            const SizedBox(height: 20,),
                            SingleChildScrollView(
                              child: SelectionArea(
                                  child: Text(widget.title),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                Container(
                  margin: const EdgeInsets.fromLTRB(30,30,30,0),
                  height: 400,
                  decoration: BoxDecoration(border: Border.all(),borderRadius: BorderRadius.circular(10)),
                  width: double.infinity,
                  padding: const EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: 
                      [
                        // SizedBox(height: 50,),
                        Column(
                          children: [
                            const Text("Summary",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w900,color: Colors.blue),),
                            const SizedBox(height: 20,),
                            SingleChildScrollView(
                              child: SelectionArea(
                                  child: Text(widget.content),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
           ],),)),
         ),
    );
  }
}