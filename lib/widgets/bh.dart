import 'package:duole/constants/bh_player.dart';
import 'package:duole/widgets/bh_player.dart';
import 'package:flutter/material.dart';

/// 潍坊保皇
class BhWidget extends StatefulWidget {
  final String abcd;
  final int sum;

  BhWidget({required this.abcd, required this.sum});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BhWidgetState();
  }
}

class _BhWidgetState extends State<BhWidget> {
  List<String> names = ['上联', '下联', '上家', '下家'];
  List<BhPlayer> buildPlayers() => List.generate(
      names.length,
      (index) => BhPlayer(
            id: index,
            name: names[index],
            sum: 0,
            cards: List.generate(3, (index) => ''),
          ));
  List<BhPlayer> players = [];

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
    return Container(
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
                        BhPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
                          player: players[0],
                          onChange: (j, value) {
                            onChange(0, j, value);
                          },
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        BhPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
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
                        BhPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
                          player: players[2],
                          onChange: (j, value) {
                            onChange(2, j, value);
                          },
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        BhPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
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
    );
  }
}
