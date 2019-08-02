import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pongis/models/game.dart';
import './bloc.dart';

class GameBloc extends Bloc<GameEvent, Game> {
  final Game _game = Game();

  GameBloc();

  @override
  Game get initialState => _game..resetGame();

  @override
  Stream<Game> mapEventToState(GameEvent event) async* {
    print('Event called: $event');
    switch (event) {
      case GameEvent.resetGame:
        _game.resetGame();
        yield Game.copyGame(_game);
        break;
      case GameEvent.incrementA:
        _game.incrementScore(PlayerName.a);
        yield Game.copyGame(_game);
        break;
      case GameEvent.incrementB:
        _game.incrementScore(PlayerName.b);
        yield Game.copyGame(_game);
        break;
      case GameEvent.decrementA:
        _game.decrementScore(PlayerName.a);
        yield Game.copyGame(_game);
        break;
      case GameEvent.decrementB:
        _game.decrementScore(PlayerName.b);
        yield Game.copyGame(_game);
        break;
      default:
        print('Did not understand event');
    }
  }
}


