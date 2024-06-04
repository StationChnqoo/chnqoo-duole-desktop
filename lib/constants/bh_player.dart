class BhPlayer {
  int id;
  String name;
  int sum;
  List<String> cards;

  BhPlayer({
    required this.id,
    required this.name,
    required this.sum,
    required this.cards, // [进贡、吃贡、出牌]
  });
}
