import 'package:flutter/material.dart';

class EditText extends StatefulWidget {
  final String hintText;
  final String labelText;
  final onChange;

  EditText(
      {required this.hintText,
      required this.labelText,
      required this.onChange});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EditTextState();
  }
}

class EditTextState extends State<EditText> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
      flex: 1,
      child: TextField(
        // controller: controller,
        onChanged: widget.onChange,
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
