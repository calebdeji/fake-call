import 'package:flutter/material.dart';
import 'dart:math';
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
