import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'styles.dart';
import 'package:walk_on_flutter/reducers/app_state_reducer.dart';
import 'package:walk_on_flutter/pages/home_page.dart';
import 'package:walk_on_flutter/models/models.dart';
import 'package:walk_on_flutter/actions/actions.dart';

void main() {
  // Don't allow landscape mode
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(WalkOnReduxApp()));
}

class WalkOnReduxApp extends StatelessWidget {
  final store = Store<AppState>(
    appReducer,
    initialState: AppState(),
  );

  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
      primaryColor: AppColor.midnightSky,
      accentColor: AppColor.midnightCloud,
      primaryTextTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorLight,
            displayColor: AppColor.textColorLight,
          ),
      textTheme: Theme.of(context).textTheme.apply(
            bodyColor: AppColor.textColorDark,
            displayColor: AppColor.textColorDark,
          ),
    );

    return StoreProvider(
      store: store,
      child: MaterialApp(
        title: 'Weather App',
        debugShowCheckedModeBanner: false,
        theme: theme,
        routes: {
          "/": (context) {
            return HomePage(
              onInit: () {
                StoreProvider.of<AppState>(context).dispatch(LoadTodosAction());
              },
            );
          }
        },
      ),
    );
  }
}
