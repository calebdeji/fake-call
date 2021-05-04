import 'package:fakeCall/ui/components/Input/Input.dart';
import 'package:fakeCall/ui/components/Select/Select.dart';
import 'package:fakeCall/ui/templates/GenericScreen/GenericScreen.dart';
import 'package:fakeCall/ui/views/Home/Home.form.dart';
import 'package:fakeCall/ui/views/Home/HomeModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:stacked/stacked_annotations.dart';

@FormView(fields: [FormTextField(name: 'phoneNumber')])
class HomeView extends HookWidget with $HomeView {
  final List<SelectOption> time = [
    SelectOption(key: '1 mins', value: '1'),
    SelectOption(key: '5 mins', value: '5'),
    SelectOption(key: '30 mins', value: '30'),
    SelectOption(key: '1 hour', value: '60')
  ];

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeModel>.reactive(
      viewModelBuilder: () => HomeModel(),
      onModelReady: (model) => listenToFormUpdated(model),
      builder: (context, viewModel, child) {
        return GenericScreen(
          title: 'Input phone number',
          description: 'The inputted number will be given a call',
          asset: Image.asset('assets/images/lock.png'),
          form: Column(
            children: [
              Input(
                icon: Icons.phone,
                label: 'Phone number',
                keyboardType: TextInputType.phone,
                controller: phoneNumberController,
                errorMessage: viewModel.phoneNumberErrorMessage,
                handleChange: viewModel.handlePhoneNumberChange,
              ),
              SizedBox(
                height: 10,
              ),
              Select(
                label: 'Schedule call',
                options: time,
                hintText: 'Choose time',
                handleChange: viewModel.handleSelectChange,
                value: viewModel.selectedValue,
              ),
            ],
          ),
          buttonText: 'Call number',
          handleSubmit: viewModel.handleSubmit,
          isLoading: viewModel.isBusy,
        );
      },
    );
  }
}
