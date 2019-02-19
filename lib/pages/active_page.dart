import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import '../models/app_state.dart';
import '../models/app_tab.dart';

class ActivePage extends StatelessWidget {
  final ViewModelBuilder<AppTab> builder;

  ActivePage({Key key, @required this.builder}) :super(key:key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, AppTab>(
      distinct: true,
      converter: (Store<AppState> store) => store.state.activeTab,
      builder: builder,
    );
  }
}