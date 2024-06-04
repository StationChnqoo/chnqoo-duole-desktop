import 'package:duole/constants/fonts.dart';
import 'package:duole/constants/gj_player.dart';
import 'package:duole/widgets/edit_text.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class GjPlayerWidget extends StatefulWidget {
  GjPlayer player;
  final onChange;
  final int sum;
  final String abcd;

  GjPlayerWidget(
      {required this.player,
      required this.onChange,
      required this.sum,
      required this.abcd});

  @override
  State<StatefulWidget> createState() => GjPlayerWidgetState();
}

class GjPlayerWidgetState extends State<GjPlayerWidget> {
  String findUsefulCards() {
    String result = '';
    String abcd = widget.abcd;

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
      widget.sum -
      widget.player.cards[0].length -
      widget.player.cards[2].length +
      widget.player.cards[1].length;

  double calcUselesPercent() {
    double result = calcUselessCards() / widget.sum;
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
        flex: 2,
        child: Container(
          width: double.infinity,
          child: Card.outlined(
            margin: EdgeInsets.zero,
            child: Container(
                padding: EdgeInsets.all(12),
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
                        Row(
                          children: [
                            Text(
                              '${findUsefulCards()} / ',
                              style: TextStyle(
                                  fontSize: 14, color: Colors.black87),
                            ),
                            Text(
                              '${calcUselessCards()}',
                              style: TextStyle(
                                  fontSize: 32,
                                  color: Colors.red,
                                  fontFamily: Fonts.TimebombBb),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 1,
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
                          color: Colors.green,
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
                          color: Colors.red,
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
                          color: Colors.black54,
                          onChange: (value) {
                            widget.onChange(2, value);
                          },
                        )
                      ],
                    ),
                  ],
                )),
          ),
        ));
  }
}
