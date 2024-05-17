import 'package:duole/widgets/edit_text.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        fit: FlexFit.tight,
        child: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.amber),
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    EditText(hintText: '进贡', labelText: '请输入进贡'),
                    EditText(hintText: '进贡', labelText: '请输入进贡')
                  ],
                )
              ],
            )));
  }
}
