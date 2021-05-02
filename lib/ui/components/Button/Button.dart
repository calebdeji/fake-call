import 'package:fakeCall/constants/colors.dart';
import 'package:fakeCall/ui/components/Paragraph/Paragraph.dart';
import 'package:flutter/material.dart';

enum ButtonVariant { primary, secondary, text, link }

class Button extends StatelessWidget {
  Button(
      {this.key,
      this.isLoading,
      this.variant,
      this.text,
      this.textColor,
      this.handleTap,
      this.prefixIcon,
      this.suffixIcon})
      : super(key: key);

  final Key key;
  final bool isLoading;
  final ButtonVariant variant;
  final String text;
  final Color textColor;
  final Function handleTap;
  final IconData prefixIcon;
  final IconData suffixIcon;

  BoxDecoration getContainerStyle() {
    switch (variant) {
      case ButtonVariant.primary:
        return BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: <Color>[Color(0xFF6FA4FF), Color(0xFF3580FF)]));

      case ButtonVariant.text:
      case ButtonVariant.link:
      default:
        return BoxDecoration();
    }
  }

  Paragraph getText() {
    switch (variant) {
      case ButtonVariant.primary:
        return Paragraph(
          text: text,
          align: TextAlign.center,
          color: textColor ?? white100,
          size: 1,
        );

      case ButtonVariant.link:
        return Paragraph(
          text: text,
          color: textColor ?? blue200,
          size: 3,
        );

      case ButtonVariant.text:
        return Paragraph(
          text: text,
          color: textColor ?? black100,
        );

      default:
        return Paragraph(
          text: text,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final double height =
        (variant ?? ButtonVariant.text) == ButtonVariant.primary ? 60 : null;
    final Alignment alignment =
        (variant ?? ButtonVariant.text) == ButtonVariant.primary
            ? Alignment.center
            : null;
    return (isLoading ?? false)
        ? Container(
            decoration: getContainerStyle(),
            child: Center(
              child: Container(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation(white100),
                ),
                height: 20,
                width: 20,
              ),
            ),
            height: height,
          )
        : GestureDetector(
            child: Container(
              decoration: getContainerStyle(),
              child: Row(
                children: <Widget>[
                  if (prefixIcon != null)
                    Icon(
                      prefixIcon,
                      color: textColor ?? blue200,
                    ),
                  getText(),
                  if (suffixIcon != null)
                    Icon(
                      suffixIcon,
                      color: textColor ?? blue200,
                    )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
              height: height,
              alignment: alignment,
            ),
            onTap: handleTap,
          );
  }
}
