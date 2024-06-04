import 'package:duole/constants/gj_player.dart';
import 'package:duole/widgets/edit_text.dart';
import 'package:duole/widgets/gj_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 够级
class GjWidget extends StatefulWidget {
  final String abcd;
  final int fu; // 几副牌 [4, 6]

  GjWidget({required this.abcd, required this.fu});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GjWidgetState();
  }
}

class _GjWidgetState extends State<GjWidget> {
  List<String> names = ['对家', '上家', '下家'];

  List<GjPlayer> players = [];
  bool isBird = false;
  String usefulCards = '';

  onChange(int i, int j, String value) {
    var _players = [...players];
    _players[i].cards[j] = value;
    setState(() {
      players = _players;
    });
  }

  List<GjPlayer> buildPlayers() => List.generate(
      names.length,
      (index) => GjPlayer(
            id: index,
            name: names[index],
            sum: 0,
            cards: List.generate(3, (index) => ''),
          ));

  String buildUsefulCards() => [
        '${filledCards(4, 'D')}${filledCards(4, 'X')}${filledCards(16, '2')}',
        '${isBird ? filledCards(6, 'Y') : ''}${filledCards(6, 'D')}${filledCards(6, 'X')}${filledCards(24, '2')}'
      ][widget.fu];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    int sum = [40, isBird ? 51 : 50][widget.fu];
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
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GjPlayerWidget(
                          abcd: widget.abcd,
                          sum: sum,
                          player: players[0],
                          onChange: (j, value) {
                            onChange(0, j, value);
                          },
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Flexible(
                          flex: 1,
                          fit: FlexFit.tight,
                          child: Container(
                            child: Card.outlined(
                              margin: EdgeInsets.zero,
                              child: Container(
                                padding: EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '剩的大牌',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(usefulCards),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '是否带鹰模式',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Switch(
                                            value: isBird,
                                            onChanged: (value) {
                                              isBird = value;
                                              setState(() {});
                                            })
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
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
                          sum: sum,
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
                          sum: sum,
                          player: players[2],
                          onChange: (j, value) {
                            onChange(2, j, value);
                          },
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    EditText(
                        hintText: '请输入出的大牌 --> 鹰Y 大王D 小王X 2A',
                        labelText: '鹰 大王 小王 2',
                        color: Colors.black,
                        onChange: (String value) {
                          String all = buildUsefulCards();
                          for (int i = 0; i < value.length; i++) {
                            int index = all.indexOf(value[i].toUpperCase());
                            if (index >= 0) {
                              all = all.substring(0, index) +
                                  all.substring(index + 1);
                            }
                          }
                          usefulCards = all;
                          setState(() {});
                        })
                  ],
                )
              ],
            ),
    );
  }

  filledCards(int n, String c) {
    return List.filled(n, c).join('');
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    players = [...buildPlayers()];
    usefulCards = buildUsefulCards();
    setState(() {});
  }
}
