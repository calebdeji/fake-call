import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(
      {this.icon,
      this.controller,
      this.label,
      this.errorMessage,
      this.placeHolder,
      this.obscureText,
      this.validator,
      this.handleChange,
      this.suffixIcon,
      this.keyboardType});

  final IconData icon;
  final TextEditingController controller;
  final String label;
  final String errorMessage;
  final String placeHolder;
  final TextInputType keyboardType;
  final bool obscureText;
  final String Function(String value) validator;
  final Function(String value) handleChange;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: TextFormField(
            keyboardType: keyboardType ?? TextInputType.text,
            obscureText: obscureText ?? false,
            controller: controller ?? null,
            validator: validator,
            onChanged: handleChange,
            decoration: InputDecoration(
                prefixIcon: Icon(icon ?? Icons.input),
                labelText: label ?? '',
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                errorText: errorMessage,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)))),
          ),
          margin: EdgeInsets.only(bottom: 25),
        ),
        if (suffixIcon != null)
          Positioned(
            child: suffixIcon,
            right: 0,
          )
      ],
    );
  }
}
