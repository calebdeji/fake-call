import 'package:fakeCall/networks/API.dart';
import 'package:flutter/cupertino.dart';

Future<APIResponse> makeCall(
    {@required int time, @required String phoneNumber}) async {
  return await API
      .post('/setUpCall', {"time": time, "phone_number": phoneNumber});
}
