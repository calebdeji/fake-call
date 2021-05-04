import 'package:fakeCall/constants/colors.dart';
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

String getNamePrefixs(String name) {
  List<String> splittedNames = name.split(' ');
  return '${splittedNames[0][0]} ${splittedNames.length > 1 ? splittedNames[1][0] : ''}'
      .toUpperCase();
}

Color getBackgroundCOlorBasedOnName(String name) {
  List<String> alphabeths = [
    "a",
    "b",
    "c",
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k",
    "l",
    "m",
    "n",
    "o",
    "p",
    "q",
    "r",
    "s",
    "t",
    "u",
    "v",
    "w",
    "x",
    "y",
    "z"
  ];

  final int indexOfNameFirstCharacter =
      alphabeths.indexOf(name[0].toLowerCase());

  final int indexOfNameSecondCharacter =
      alphabeths.indexOf(name.length > 1 ? name[1].toLowerCase() : 'd');

  if (indexOfNameFirstCharacter == -1) {
    return yellow100;
  } else if (indexOfNameFirstCharacter % 3 == 0 &&
      indexOfNameSecondCharacter % 2 == 0) {
    return blue200;
  } else if (indexOfNameFirstCharacter % 6 == 0 &&
      indexOfNameSecondCharacter % 3 == 0) {
    return gray100;
  } else if (indexOfNameFirstCharacter % 12 == 0 ||
      indexOfNameSecondCharacter % 2 == 0) {
    return primaryColor;
  } else if (indexOfNameFirstCharacter % 2 == 0 ||
      indexOfNameSecondCharacter % 3 == 0) {
    return purple100;
  }

  return brown100;
}
