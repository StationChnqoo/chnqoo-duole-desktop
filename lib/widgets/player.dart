import 'package:duole/constants/player.dart';
import 'package:duole/widgets/edit_text.dart';
import 'package:flutter/material.dart';

class PlayerWidget extends StatefulWidget {
  Player player;

  PlayerWidget({required this.player});

  @override
  State<StatefulWidget> createState() => _PlayerWidgetState();
}

class _PlayerWidgetState extends State<PlayerWidget> {
  String findUsefulCards() {
    List<String> cards = '34567890JQKA'.split('');
    widget.player.uselessCards.characters.map((e) {
      if (cards.contains(e.toUpperCase())) {
        cards.remove(e);
      }
    });
    return cards.join('');
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
                      '${findUsefulCards()} -> ${40 - widget.player.uselessCards.length - widget.player.outCards.length + widget.player.inCards.length}张',
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  // mainAxisSize: MainAxisSize.max,
                  children: [
                    EditText(hintText: '进贡', labelText: '请输入进贡'),
                    SizedBox(
                      width: 12,
                    ),
                    EditText(hintText: '吃贡', labelText: '请输入吃贡')
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  children: [EditText(hintText: '记录', labelText: '请输入出牌记录')],
                ),
              ],
            )));
  }
}
