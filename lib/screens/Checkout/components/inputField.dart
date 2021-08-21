import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skripsian/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String text;
  final String hintText;
  final ValueChanged<String> onChanged;
  final FormFieldValidator validator;

  const RoundedInputField(
      {Key? key,
      required this.hintText,
      required this.text,
      required this.onChanged,
      required this.validator})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(text),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: kGrayColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: TextFormField(
              onEditingComplete: () {
                SystemChrome.setEnabledSystemUIOverlays([]);
              },
              onChanged: (val) {
                print("cie bisa");
                SystemChrome.setEnabledSystemUIOverlays([]);
                return;
              },
              decoration: InputDecoration(
                hintText: hintText,
                border: InputBorder.none,
              ),
              validator: validator,
            ),
          ),
        ],
      ),
    );
  }
}
