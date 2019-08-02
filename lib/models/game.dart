import 'package:equatable/equatable.dart';
import 'package:pongis/models/player.dart';

class Game extends Equatable {
  static final Player _playerA = Player(playerName: PlayerName.a);
  static final Player _playerB = Player(playerName: PlayerName.b);

  Game() : super([_playerA, _playerB]);

  void incrementScore(PlayerName playerName) => getPlayer(playerName).score++;
  void decrementScore(PlayerName playerName) => getPlayer(playerName).score > 0
    ? getPlayer(playerName).score--
    : getPlayer(playerName).score = 0;
  void resetGame() { _playerA.score = 0; _playerB.score = 0; }
  Player getPlayer(PlayerName playerName) => playerName == PlayerName.a ? _playerA : _playerB;

}