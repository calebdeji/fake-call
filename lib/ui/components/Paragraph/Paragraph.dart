import 'package:fakeCall/constants/colors.dart';
import 'package:flutter/material.dart';

class Paragraph extends StatelessWidget {
  /// size 1 = 18px, 2 = 17px, 3 = 14px;

  Paragraph({this.key, @required this.text, this.size, this.color, this.align})
      : super(key: key);

  final Key key;
  final String text;
  final int size;
  final Color color;
  final TextAlign align;

  TextStyle getTextStyle() {
    Color textColor = color ?? black100;
    switch (size) {
      case 1:
        return TextStyle(color: textColor, fontSize: 18, height: 1.6);

      case 2:
        return TextStyle(color: textColor, fontSize: 17, height: 1.5);

      case 3:
        return TextStyle(color: textColor, fontSize: 14, height: 1.4);

      case 4:
        return TextStyle(color: textColor, fontSize: 12, height: 1.3);

      default:
        return TextStyle();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: getTextStyle(),
      textAlign: align ?? TextAlign.start,
    );
  }
}
