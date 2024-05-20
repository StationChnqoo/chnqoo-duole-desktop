import 'package:duole/widgets/bh.dart';
import 'package:flutter/material.dart';

/// 潍坊保皇
class FkbhPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FkbhPageState();
  }
}

class _FkbhPageState extends State<FkbhPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('疯狂保皇'),
      ),
      body: Container(
          // decoration: BoxDecoration(color: Colors.amber),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [BhWidget(abcd: '67890JQKA2', sum: 30)],
          )),
    );
  }
}
