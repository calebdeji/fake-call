import 'package:fakeCall/ui/components/ContactPicker/ContactPickerModel.dart';
import 'package:fakeCall/ui/components/ContactsList/ContactsList.dart';
import 'package:fakeCall/ui/components/Input/Input.dart';
import 'package:fakeCall/ui/components/Paragraph/Paragraph.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class ContactPicker extends StatelessWidget {
  ContactPicker({this.handleSelect});

  final HandleSelectContact handleSelect;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Paragraph(
          text: 'Pick Contact',
        ),
      ),
      body: ViewModelBuilder<ContactPickerModel>.nonReactive(
        viewModelBuilder: () => ContactPickerModel(),
        builder: (context, viewModel, child) {
          return viewModel.isBusy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20)
                      .copyWith(bottom: 0),
                  child: Column(
                    children: [
                      Input(
                        label: 'Search contact...',
                        icon: Icons.contact_page,
                        handleChange: viewModel.handleSearch,
                      ),
                      Expanded(
                          child: ContactsList(
                        contacts: viewModel.searchedData,
                        handleSelect: (phone) {
                          viewModel.handleSelect(handleSelect, phone);
                        },
                      ))
                    ],
                  ),
                );
        },
      ),
    );
  }
}
