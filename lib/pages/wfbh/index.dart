import 'package:duole/widgets/bh.dart';
import 'package:flutter/material.dart';

/// 潍坊保皇
class WfbhPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _WfbhPageState();
  }
}

class _WfbhPageState extends State<WfbhPage> {
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
        title: Text('潍坊保皇'),
      ),
      body: Container(
          // decoration: BoxDecoration(color: Colors.amber),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [BhWidget(abcd: '34567890JQKA2', sum: 40)],
          )),
    );
  }
}
