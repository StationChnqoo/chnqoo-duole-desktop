import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String hintText;
  final String labelText;

  EditText({required this.hintText, required this.labelText});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _EditTextState();
  }
}

class _EditTextState extends State<EditText> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      flex: 1,
      child: TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 1, horizontal: 8),
            hintText: widget.hintText,
            labelText: widget.labelText,
            // floatingLabelBehavior: FloatingLabelBehavior.always,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
      ),
    );
  }
}
