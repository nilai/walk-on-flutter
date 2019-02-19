import 'package:flutter/material.dart';
import '../models/app_tab.dart';
import '../widgets/tab_selector.dart';
import 'active_page.dart';
import 'feed_page.dart';
import 'board_page.dart';
import 'sing_page.dart';
import 'message_page.dart';
import 'profile_page.dart';

class HomePage extends StatefulWidget {
  final void Function() onInit;

  HomePage({@required this.onInit}) : super(key: Key('__homePage__'));

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
          body: _getActivePage(activeTab),
          bottomNavigationBar: TabSelector(),
        );
      },
    );
  }

  Widget _getActivePage(AppTab activeTab) {
    Widget container;

    switch (activeTab) {
      case AppTab.feed:
        container = FeedPage();
        break;
      case AppTab.board:
        container = BoardPage();
        break;
      case AppTab.sing:
        container = SingPage();
        break;
      case AppTab.message:
        container = MessagePage();
        break;
      case AppTab.profile:
        container = ProfilePage();
        break;
      default:
        container = Container();
    }

    return container;
  }
}
