import 'package:fakeCall/constants/colors.dart';
import 'package:fakeCall/ui/components/Button/Button.dart';
import 'package:fakeCall/ui/components/Heading/Heading.dart';
import 'package:fakeCall/ui/components/Paragraph/Paragraph.dart';
import 'package:flutter/material.dart';

class GenericScreen extends StatelessWidget {
  GenericScreen(
      {this.form,
      this.handleSubmit,
      this.asset,
      this.isLoading,
      @required this.buttonText,
      @required this.description,
      @required this.title});

  final Widget form;
  final String buttonText;
  final String description;
  final String title;
  final Function handleSubmit;
  final Widget asset;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 61),
          child: Column(
            children: <Widget>[
              asset,
              SizedBox(
                height: 26,
              ),
              Heading(
                text: title,
                align: TextAlign.center,
                size: 1,
              ),
              SizedBox(
                height: 17,
              ),
              Paragraph(
                text: description,
                size: 2,
                color: gray100,
                align: TextAlign.center,
              ),
              SizedBox(
                height: 32,
              ),
              if (form != null) form,
              SizedBox(
                height: 98,
              ),
              Button(
                variant: ButtonVariant.primary,
                text: buttonText,
                handleTap: handleSubmit ?? () {},
                isLoading: isLoading ?? false,
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.end,
          ),
        ),
      ),
    );
  }
}
