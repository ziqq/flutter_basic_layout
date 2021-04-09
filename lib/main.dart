import 'package:flutter/material.dart';
import 'package:stacked_themes/stacked_themes.dart';

import 'package:flutter_basic_layout/locator.dart';
import 'package:flutter_basic_layout/ui/theme_setup.dart';
import 'package:flutter_basic_layout/app/router.dart' as router;
import 'package:flutter_basic_layout/app/route_constants.dart' as routes;

Future main() async {
  await ThemeManager.initialise();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
      themes: getThemes(),
      builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
        title: 'Scrolled Layout',
        theme: regularTheme,
        darkTheme: darkTheme,
        themeMode: themeMode,
        initialRoute: routes.MainViewRoute,
        onGenerateRoute: router.generateRoute,
      ),
    );
  }
}
