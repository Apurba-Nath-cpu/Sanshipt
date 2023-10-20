import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sanshipt/models/user.dart' as model;
import '../models/user.dart';
import '../models/user.dart';
import '../providers/user_provider.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {

  int _page = 0;
  late PageController pageController;

  @override
  void initState(){
    super.initState();
    pageController = PageController();
  }

  void dispose(){
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page){
    pageController.jumpToPage(page);
  }

  Widget build(BuildContext context) {
    model.User user = Provider.of(context)<UserProvider>(context).getUser();
    return Scaffold(
      body: Container(),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Color.fromARGB(255, 60, 60, 60),
        items: [],
      ),
    );
  }
}
