import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pongis/blocs/bloc/bloc.dart';
import 'package:pongis/models/game.dart';
import 'package:pongis/pages/game.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static final title = 'Pongis';
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: title,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CounterApp(title: title),
    );
  }
}

class CounterApp extends StatelessWidget {
  const CounterApp({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: BlocProvider<GameBloc>(
          builder: (context) => GameBloc(),
          child: GamePage(),
        ),
      ),
    );
  }
}
