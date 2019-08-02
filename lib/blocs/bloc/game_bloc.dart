import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:pongis/models/game.dart';
import 'package:pongis/models/player.dart';
import './bloc.dart';

class GameBloc extends Bloc<GameEvent, Game> {
  final Game _game;

  GameBloc({Game game}) : _game = game;

  @override
  Game get initialState => _game..resetGame();

  @override
  Stream<Game> mapEventToState(
    GameEvent event,
  ) async* {
    print('Event called: $event');
    switch (event) {
      case GameEvent.resetGame:
        yield _game..resetGame();
        break;
      case GameEvent.incrementA:
        yield _game..incrementScore(PlayerName.a);
        break;
      case GameEvent.incrementB:
        yield _game..incrementScore(PlayerName.b);
        break;
      case GameEvent.decrementA:
        yield _game..decrementScore(PlayerName.a);
        break;
      case GameEvent.decrementB:
        yield _game..decrementScore(PlayerName.b);
        break;
      default:
        print('Did not understand event');
    }
  }
}


