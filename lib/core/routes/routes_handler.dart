import 'package:architecture_project/main.dart';
import 'package:flutter/material.dart';

import 'routes_name.dart';

class RoutesHandler {
  final String initialRoutes = RoutesName.initial;
  static const initialNavbarVisibility = true;

  static MaterialPageRoute get _emptyPage {
    return MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('Not Found', style: appTextTheme(context).labelLarge),
          ),
        );
      },
    );
  }

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case RoutesName.initial:
      //   return MaterialPageRoute(
      //     builder: (context) => IntroPage(),
      //     settings: settings,
      //   );

      default:
        return _emptyPage;
    }
  }
}
