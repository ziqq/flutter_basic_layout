import 'package:flutter/material.dart';
import 'package:flutter_basic_layout/ui/views/first/first_view.dart';
import 'package:flutter_basic_layout/ui/views/second/second_view.dart';

import 'route_constants.dart' as routes;

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case routes.FirstViewRoute:
      return MaterialPageRoute(builder: (_) => FirstView());
      break;
    case routes.SecondViewRoute:
      return MaterialPageRoute(builder: (_) => SecondView());
      break;
    default:
      return MaterialPageRoute(builder: (_) => FirstView());
  }
}
