import 'package:flutter/rendering.dart';

Color getColorFromHexValue(String hexValue) {
  return Color(int.parse('0xFF$hexValue'.toUpperCase()));
}

String appendNigeriaCallingCodeToPhoneNumber(String phoneNumber) {
  const nigeriaPhoneNumberLength = 11;
  if (phoneNumber.length == nigeriaPhoneNumberLength) {
    return "+234${phoneNumber.substring(1)}";
  }
  return phoneNumber;
}
