import 'package:duole/constants/game.dart';
import 'package:duole/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  List<Game> games = [];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('多乐棋牌助手'),
      ),
      body: Container(
          // decoration: BoxDecoration(color: Colors.amber),
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              ...games.map((e) => Container(
                    margin: EdgeInsets.only(bottom: 12),
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(e.page);
                      },
                      child: Card.outlined(
                          margin: EdgeInsets.zero,
                          child: Container(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  e.title,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black87),
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  e.message,
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black54),
                                )
                              ],
                            ),
                          )),
                    ),
                  ))
            ],
          )),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    games = [
      Game(page: RoutesClass.WFBH, title: '潍坊保皇', message: '憋3，有345，每人41张牌'),
      Game(page: RoutesClass.FKBH, title: '疯狂保皇', message: '憋6，无345，每人31张牌')
    ];
    setState(() {});
  }
}
