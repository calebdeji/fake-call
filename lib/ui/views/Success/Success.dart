import 'package:fakeCall/ui/templates/GenericScreen/GenericScreen.dart';
import 'package:fakeCall/ui/views/Success/SuccessModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

class SuccessView extends StatelessWidget {
  SuccessView({this.minutes, this.phoneNumber});

  final int minutes;
  final String phoneNumber;

  String getParsedTime() {
    if (minutes == 60)
      return '1 hour';
    else if (minutes == 1) return '1 minute';
    return '$minutes minutes';
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SuccessModel>.nonReactive(
      viewModelBuilder: () => SuccessModel(),
      builder: (context, viewModel, child) {
        return GenericScreen(
          asset: Lottie.asset('assets/data/success.json',
              animate: true, fit: BoxFit.cover, repeat: false),
          buttonText: 'Make another call',
          description:
              "${phoneNumber ?? 'phone number'} will be called in ${getParsedTime()} time",
          title: 'Success',
          handleSubmit: viewModel.handleNavigation,
        );
      },
    );
  }
}
