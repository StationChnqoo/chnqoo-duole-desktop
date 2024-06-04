import 'package:duole/constants/gj_player.dart';
import 'package:duole/widgets/gj_player.dart';
import 'package:flutter/material.dart';

/// 够级
class GjWidget extends StatefulWidget {
  final String abcd;
  final int sum;

  GjWidget({required this.abcd, required this.sum});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GjWidgetState();
  }
}

class _GjWidgetState extends State<GjWidget> {
  List<String> names = ['对家', '上家', '下家'];
  List<GjPlayer> buildPlayers() => List.generate(
      names.length,
      (index) => GjPlayer(
            id: index,
            name: names[index],
            sum: 0,
            cards: List.generate(3, (index) => ''),
          ));
  List<GjPlayer> players = [];

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
                        Flexible(
                          child: Container(),
                          flex: 1,
                        ),
                        GjPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
                          player: players[0],
                          onChange: (j, value) {
                            onChange(0, j, value);
                          },
                        ),
                        Flexible(
                          child: Container(),
                          flex: 1,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        GjPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
                          player: players[1],
                          onChange: (j, value) {
                            onChange(1, j, value);
                          },
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        GjPlayerWidget(
                          abcd: widget.abcd,
                          sum: widget.sum,
                          player: players[2],
                          onChange: (j, value) {
                            onChange(2, j, value);
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
