import 'package:duole/constants/player.dart';
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
  List<String> names = ['上联', '下联', '上家', '下家'];
  List<Player> buildPlayers() => List.generate(
      names.length,
      (index) => Player(
            id: index,
            name: names[index],
            sum: 0,
            cards: List.generate(3, (index) => ''),
          ));
  List<Player> players = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    players = [...buildPlayers()];
    setState(() {});
  }

  onChange(int i, int j, String value) {
    var _players = [...players];
    _players[i].cards[j] = value;
    setState(() {
      players = _players;
    });
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
        child: players.length == 0
            ? Container()
            : Column(
                children: <Widget>[
                  Column(
                    children: [
                      Row(
                        children: [
                          PlayerWidget(
                            player: players[0],
                            onChange: (j, value) {
                              onChange(0, j, value);
                            },
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          PlayerWidget(
                            player: players[1],
                            onChange: (j, value) {
                              onChange(1, j, value);
                            },
                          )
                        ],
                      ),
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        children: [
                          PlayerWidget(
                            player: players[2],
                            onChange: (j, value) {
                              onChange(2, j, value);
                            },
                          ),
                          SizedBox(
                            width: 24,
                          ),
                          PlayerWidget(
                            player: players[3],
                            onChange: (j, value) {
                              onChange(3, j, value);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
      ),
    );
  }
}
