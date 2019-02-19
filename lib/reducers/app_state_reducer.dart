import '../models/app_state.dart';
import '../reducers/tabs_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(
    activeTab: tabsReducer(state.activeTab, action)
  );
}