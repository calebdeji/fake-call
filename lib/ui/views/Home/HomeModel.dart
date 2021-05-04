import 'package:fakeCall/app/app.locator.dart';
import 'package:fakeCall/networks/call/call.dart';
import 'package:fakeCall/service/Toaster/Toaster.dart';
import 'package:fakeCall/ui/views/Home/Home.form.dart';
import 'package:fakeCall/utils/helpers.dart';
import 'package:fakeCall/utils/validators.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:fakeCall/app/app.router.dart';

class HomeModel extends FormViewModel {
  String selectedValue = '1';
  String phoneNumberErrorMessage;
  bool isFired = false;

  @override
  void setFormStatus() {
    // TODO: implement setFormStatus
  }

  final NavigationService _navigationService = locator<NavigationService>();
  final ToasterService _toasterService = locator<ToasterService>();

  void handleSelectChange(dynamic value) {
    selectedValue = value;
    notifyListeners();
  }

  void handlePhoneNumberChange(String phone) {
    if (isFired) {
      if (!isPhoneNumberAValidNigeriaPhoneNumber(phone ?? '')) {
        phoneNumberErrorMessage = 'Input a valid Nigeria phone number';
      } else {
        phoneNumberErrorMessage = null;
      }
    }
    notifyListeners();
  }

  void handleSubmit() async {
    try {
      if (!isFired) {
        isFired = true;
        handlePhoneNumberChange(phoneNumberValue);
      }
      if (phoneNumberErrorMessage == null) {
        int parsedTimeSelected = int.parse(selectedValue);
        await runBusyFuture(makeCall(
            time: parsedTimeSelected,
            phoneNumber:
                appendNigeriaCallingCodeToPhoneNumber(phoneNumberValue)));

        _navigationService.navigateTo(Routes.successView,
            arguments: SuccessViewArguments(
                minutes: parsedTimeSelected, phoneNumber: phoneNumberValue));
      }
    } catch (e) {
      _toasterService
          .toastErrorMessage(e.message ?? 'unable to perform action');
    }
  }
}
