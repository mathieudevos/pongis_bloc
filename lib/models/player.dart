import 'package:equatable/equatable.dart';

enum PlayerName { a, b }

class Player extends Equatable {
  final PlayerName playerName;
  int score;

  Player({
    this.playerName,
    this.score = 0,
  }) : super([playerName, score]);

  @override
  String toString() {
    return 'Player { PlayerName: $playerName, score: $score }';
  }
}
