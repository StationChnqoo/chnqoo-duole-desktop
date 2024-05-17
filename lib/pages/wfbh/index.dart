import 'package:duole/widgets/player.dart';
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
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('潍坊保皇'),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  children: [
                    PlayerWidget(),
                    SizedBox(
                      width: 12,
                    ),
                    PlayerWidget()
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    PlayerWidget(),
                    SizedBox(
                      width: 12,
                    ),
                    PlayerWidget()
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
