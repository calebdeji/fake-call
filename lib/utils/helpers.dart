import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter/rendering.dart';

Color getColorFromHexValue(String hexCode) {
  final String strimmedColor =
      hexCode.startsWith('#') ? hexCode.substring(1) : hexCode;
  final int parsedColor = int.parse('0xFF$strimmedColor'.toUpperCase());
  return Color(parsedColor);
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

int hashStringWord(String word) {
  int hash = 0;
  for (var i = 0; i < word.length; i++) {
    hash = word.codeUnitAt(i) + ((hash << 5) - hash);
  }
  return hash;
}

Color intToColor(int hash) {
  String hexCode = '#';

  for (var i = 0; i < 3; i++) {
    var value = (hash >> (i * 8)) & 0XFF;
    String code = hexCode + ('00' + value.toRadixString(16));
    hexCode = hexCode + code.substring(code.length - 2);
  }

  return getColorFromHexValue(hexCode);
}

Color generateRandomColorBasedOnString(String word) {
  return intToColor(hashStringWord(word));
}

Color generateRandomColor() {
  final _random = Random();

  return Colors.primaries[_random.nextInt(Colors.primaries.length)]
      [_random.nextInt(9) * 100];
}

T getkeywordDataFromList<T extends List>(T data, String keyword) {
  try {
    return data.map((e) {
      String name = e.name;
      if (name != null) {
        if (name.contains(keyword)) return e;
      } else {
        throw Exception('Name property not found');
      }
    }).toList();
  } catch (e) {
    return null;
  }
}
