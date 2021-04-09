import 'package:flutter_basic_layout/services/navigation_services.dart';
import 'package:flutter_basic_layout/locator.dart';

import '../../viewmodels/basemodel.dart';

class HomeViewModel extends BaseModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future logout({bool success = true}) async {
    setBusy(true);
    await Future.delayed(Duration(seconds: 1));

    if (!success) {
      setErrorMessage('Error has occured during sign out');
    } else {
      _navigationService.goBack();
    }
  }
}
