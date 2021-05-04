import 'package:fakeCall/app/app.locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked_services/stacked_services.dart';

class SuccessModel extends ChangeNotifier {
  final NavigationService _navigationService = locator<NavigationService>();

  void handleNavigation() {
    _navigationService.back();
  }
}
