import 'package:fakeCall/constants/colors.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ToasterService {
  void toastErrorMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: red100,
      textColor: white100,
    );
  }

  void toastSuccessMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: primaryColor,
      textColor: white100,
    );
  }
}
