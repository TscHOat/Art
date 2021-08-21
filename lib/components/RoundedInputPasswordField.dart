import 'package:flutter/material.dart';
import 'package:skripsian/components/TextFieldContainer.dart';

class RoundedInputPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;
  const RoundedInputPasswordField({
    Key? key,
    required this.validator,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: "Password",
          border: InputBorder.none,
        ),
        validator: validator,
      ),
    );
  }
}
