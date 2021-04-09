import 'package:flutter_basic_layout/locator.dart';
import 'package:flutter_basic_layout/services/navigation_services.dart';

import 'package:flutter_basic_layout/app/route_constants.dart' as routes;

import '../../viewmodels/basemodel.dart';

class SecondViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future login({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured with the first screen');
    } else {
      _navigationService.navigateTo(
        routes.FirstViewRoute,
        arguments: '\nFirstViewRoute',
      );
      setErrorMessage(null);
    }

    setBusy(false);
  }
}
