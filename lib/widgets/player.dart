import 'package:duole/constants/player.dart';
import 'package:duole/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class PlayerWidget extends StatefulWidget {
  Player player;
  final onChange;

  PlayerWidget({required this.player, required this.onChange});

  @override
  State<StatefulWidget> createState() => PlayerWidgetState();
}

class PlayerWidgetState extends State<PlayerWidget> {
  String findUsefulCards() {
    String result = '';
    String abcd = '34567890JQKA';

    for (int i = 0; i < abcd.length; i++) {
      if (widget.player.cards[2].toUpperCase().contains(abcd[i])) {
        // 出过了就不管了
      } else {
        result += abcd[i];
      }
    }
    return result;
  }

  int calcUselessCards() =>
      40 -
      widget.player.cards[0].length -
      widget.player.cards[2].length +
      widget.player.cards[1].length;

  double calcUselesPercent() {
    double result = calcUselessCards() / 40;
    return result < 0
        ? 0
        : result > 1
            ? 1
            : result;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Flexible(
        fit: FlexFit.tight,
        child: Container(
            width: double.infinity,
            // decoration: BoxDecoration(color: Colors.blue),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.player.name,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).primaryColor),
                    ),
                    Text(
                      '${findUsefulCards()} -> ${calcUselessCards()}张',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                LinearPercentIndicator(
                  // width: double.infinity,
                  padding: EdgeInsets.zero,
                  // lineHeight: 8.0,
                  percent: calcUselesPercent(),
                  lineHeight: 10,
                  barRadius: Radius.circular(5),
                  progressColor: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    EditText(
                      hintText: '进贡',
                      labelText: '请输入进贡',
                      onChange: (value) {
                        widget.onChange(0, value);
                      },
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    EditText(
                      hintText: '吃贡',
                      labelText: '请输入吃贡',
                      onChange: (value) {
                        widget.onChange(1, value);
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [
                    EditText(
                      hintText: '记录',
                      labelText: '请输入出牌记录',
                      onChange: (value) {
                        widget.onChange(2, value);
                      },
                    )
                  ],
                ),
              ],
            )));
  }
}
