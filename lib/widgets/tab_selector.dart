import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../models/models.dart';
import 'package:walk_on_flutter/actions/actions.dart';

class TabSelector extends StatelessWidget {
  final icons = [
    'images/feed_tab_normal.webp',
    'images/feed_tab_normal.webp',
    'images/feed_tab_normal.webp',
    'images/feed_tab_normal.webp',
    'images/feed_tab_normal.webp',
    ];
  final activeIcons = [
    'images/feed_tab_selected.webp',
    'images/feed_tab_selected.webp',
    'images/feed_tab_selected.webp',
    'images/feed_tab_selected.webp',
    'images/feed_tab_selected.webp',
  ];
  final tabTexts = [
    '首页',
    '榜单',
    '唱歌',
    '消息',
    '我',
  ];
  
  TabSelector({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, _ViewModel>(
      distinct: true,
      converter: _ViewModel.fromStore,
      builder: (context, vm) {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: AppTab.values.indexOf(vm.activeTab),
          onTap: vm.onTabSelected,
          items: AppTab.values.map((tab) {
            return BottomNavigationBarItem(
              icon: Image(image : AssetImage(icons[tab.index])),
              activeIcon: Image(image: AssetImage(activeIcons[tab.index]),),
              title: Text(tabTexts[tab.index]),
            );
          }).toList(),
        );
      }
    );
  }
}

class _ViewModel {
  final AppTab activeTab;
  final Function(int) onTabSelected;

  _ViewModel({
    @required this.activeTab,
    @required this.onTabSelected,
  });

  static _ViewModel fromStore(Store<AppState> store) {
    return _ViewModel(
      activeTab: store.state.activeTab,
      onTabSelected: (index) {
        store.dispatch(UpdateTabAction(AppTab.values[index]));
      }
    );
  }
}
