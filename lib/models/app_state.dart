import 'package:meta/meta.dart';
import 'package:walk_on_flutter/models/models.dart';

@immutable
class AppState {
  final AppTab activeTab;

  AppState({this.activeTab = AppTab.feed});

  factory AppState.loading() => AppState();
}
