import 'package:sanshipt/providers/user_provider.dart';
// import 'package:sanshipt/utils/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:velocity_x/velocity_x.dart';

class ResponsiveLayout extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayout({
    Key? key,
    required this.webScreenLayout,
    required this.mobileScreenLayout,
  }) : super(key: key);

  @override
  State<ResponsiveLayout> createState() => _ResponsiveLayoutState();
}

class _ResponsiveLayoutState extends State<ResponsiveLayout> {
  @override

  void initState(){
    super.initState();
    addData();
  }

  addData() async {
    UserProvider _userProvider = Provider.
      of(context, listen: false);
    await _userProvider.refreshUser();
  }

  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints){
          if(constraints.maxWidth > 600){
            return widget.webScreenLayout;
          }
          return widget.mobileScreenLayout;
        }
    );
  }
}
