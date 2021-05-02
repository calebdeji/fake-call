import 'package:flutter/rendering.dart';

Color getColorFromHexValue(String hexValue) {
  return Color(int.parse('0xFF$hexValue'.toUpperCase()));
}
