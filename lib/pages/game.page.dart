import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongis/blocs/bloc/bloc.dart';
import 'package:pongis/blocs/bloc/game_bloc.dart';
import 'package:pongis/models/game.dart';
import 'package:pongis/models/player.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GameBloc gameBloc = BlocProvider.of<GameBloc>(context);

    return BlocBuilder<GameBloc, Game>(
      builder: (context, game) {
        print('game: ${game.getPlayer(PlayerName.a).score} - ${game.getPlayer(PlayerName.b).score} ');
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () => gameBloc.dispatch(GameEvent.incrementA),
                    onLongPress: () => gameBloc.dispatch(GameEvent.decrementA),
                    child: Text(game.getPlayer(PlayerName.a).score.toString(), style: TextStyle(fontSize: 72))
                  ),
                  VerticalDivider(),
                  GestureDetector(
                    onTap: () => gameBloc.dispatch(GameEvent.incrementB),
                    onLongPress: () => gameBloc.dispatch(GameEvent.decrementB),
                    child: Text(game.getPlayer(PlayerName.b).score.toString(), style: TextStyle(fontSize: 72))
                  ),
                ],
              ),
            ),
            RaisedButton(
              onPressed: () => gameBloc.dispatch(GameEvent.resetGame),
              child: Text('Reset game'),
            )
          ],
        );
      }
    );
  }
}