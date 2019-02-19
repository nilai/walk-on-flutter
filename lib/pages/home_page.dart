import 'package:flutter/material.dart';
import '../models/app_tab.dart';
import '../widgets/tab_selector.dart';
import 'active_page.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit}) :super(key: Key('__homePage__'));

  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ActivePage(
      builder: (BuildContext context, AppTab activeTab) {
        return Scaffold(
          body: activeTab == AppTab.feed ? Container(
            color: Colors.brown,
          ) :Container(),
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }
}