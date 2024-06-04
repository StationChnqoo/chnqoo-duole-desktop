import 'package:duole/widgets/bh.dart';
import 'package:duole/widgets/gj.dart';
import 'package:flutter/material.dart';

/// 潍坊保皇
class Gj6Page extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Gj6PageState();
  }
}

class _Gj6PageState extends State<Gj6Page> {
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
        title: Text('六副牌够级'),
      ),
      body: Container(
          // decoration: BoxDecoration(color: Colors.amber),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [GjWidget(abcd: '34567890JQKA2', sum: 30)],
          )),
    );
  }
}
