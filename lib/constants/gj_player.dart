class GjPlayer {
  int id;
  String name;
  int sum;
  List<String> cards;

  GjPlayer({
    required this.id,
    required this.name,
    required this.sum,
    required this.cards, // 初始化多少牌 出的牌
  });
}
