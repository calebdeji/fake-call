import 'package:fakeCall/ui/components/Paragraph/Paragraph.dart';
import 'package:flutter/material.dart';

class SelectOption {
  SelectOption({this.key, this.value});

  final String key;
  final dynamic value;
}

class Select extends StatelessWidget {
  Select(
      {this.key,
      @required this.options,
      this.label,
      this.handleChange,
      this.value,
      this.hintText})
      : super(key: key);

  final Key key;
  final List<SelectOption> options;
  final String label;
  final Function handleChange;
  final String hintText;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (label != null)
          Container(
            child: Paragraph(
              text: label,
            ),
            alignment: Alignment.centerLeft,
          ),
        if (label != null)
          SizedBox(
            height: 10,
          ),
        SizedBox(
          height: 50,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: DropdownButton(
                    hint: Paragraph(
                      text: hintText ?? '',
                    ),
                    value: value,
                    icon: SizedBox(),
                    underline: SizedBox(),
                    items: List.of(options).map((item) {
                      return DropdownMenuItem(
                        value: item.value,
                        child: Text(item.key),
                      );
                    }).toList(),
                    onChanged: handleChange,
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                border: Border.all(color: Colors.grey)),
          ),
        ),
      ],
    );
  }
}
