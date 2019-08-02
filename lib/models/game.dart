enum PlayerName { a, b }

class Game {
  int scoreA = 0;
  int scoreB = 0;

  Game() { print('[INFO] New game object'); }

  static Game copyGame(Game game) {
    Game _game = Game();
    _game.scoreA = game.scoreA;
    _game.scoreB = game.scoreB;
    return _game;
  }

  void incrementScore(PlayerName playerName) => (playerName == PlayerName.a)
    ? scoreA++
    : scoreB++;
  void decrementScore(PlayerName playerName) {
    if (playerName == PlayerName.a) {
      if (scoreA > 0) scoreA--;
    } else {
      if (scoreB > 0) scoreB--;
    }
  }
  void resetGame() { scoreA = 0; scoreB = 0; }
  int getScore(PlayerName playerName) => playerName == PlayerName.a ? scoreA : scoreB;
}