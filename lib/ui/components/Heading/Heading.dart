import 'package:fakeCall/constants/colors.dart';
import 'package:flutter/material.dart';

class Heading extends StatelessWidget {
  /// size 1 = 24px, 2 = 22px, 3 = 20px;

  Heading({this.key, @required this.text, this.size, this.color, this.align})
      : super(key: key);

  final Key key;
  final String text;
  final int size;
  final Color color;
  final TextAlign align;

  TextStyle getHeadingStyle() {
    Color textColor = color ?? black200;
    switch (size) {
      case 1:
        return TextStyle(
            color: textColor,
            fontSize: 24,
            fontWeight: FontWeight.w500,
            height: 1.3);

      case 2:
        return TextStyle(
            color: textColor,
            fontSize: 22,
            fontWeight: FontWeight.w500,
            height: 1.2);

      case 3:
        return TextStyle(
          color: textColor,
          fontSize: 20,
          fontWeight: FontWeight.w500,
        );

      default:
        return TextStyle(
          fontWeight: FontWeight.w500,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getHeadingStyle(),
      textAlign: align ?? TextAlign.start,
    );
  }
}
