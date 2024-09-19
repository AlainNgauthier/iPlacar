// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScoreHomePage(),
    );
  }
}

class ScoreHomePage extends StatefulWidget {
  @override
  _ScoreHomePageState createState() => _ScoreHomePageState();
}

class _ScoreHomePageState extends State<ScoreHomePage> {
  int _team1Score = 0;
  int _team2Score = 0;
  List<int> _lastAction = [];

  void _updateScore(int team, int points) {
    setState(() {
      if (team == 1) {
        _team1Score += points;
      } else {
        _team2Score += points;
      }
      _lastAction = [team, points];
    });
  }

  void _undoLastAction() {
    if (_lastAction.isNotEmpty) {
      setState(() {
        if (_lastAction[0] == 1) {
          _team1Score -= _lastAction[1];
        } else {
          _team2Score -= _lastAction[1];
        }
        _lastAction = [];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Placar de jogo de basketball'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Placar',
              style: TextStyle(fontSize: 32),
            ),
            const SizedBox(height: 20),
            Text(
              'Time 1: $_team1Score',
              style: const TextStyle(fontSize: 24),
            ),
            Text(
              'Time 2: $_team2Score',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    const Text('Time 1'),
                    ElevatedButton(
                      onPressed: () => _updateScore(1, 1),
                      child: Text('Lance Livre'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateScore(1, 2),
                      child: const Text('2 Pontos'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateScore(1, 3),
                      child: const Text('3 Pontos'),
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Time 2'),
                    ElevatedButton(
                      onPressed: () => _updateScore(2, 1),
                      child: Text('Lance Livre'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateScore(2, 2),
                      child: Text('2 Pontos'),
                    ),
                    ElevatedButton(
                      onPressed: () => _updateScore(2, 3),
                      child: Text('3 Pontos'),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _lastAction.isNotEmpty ? _undoLastAction : null,
              child: Text('Voltar Lance'),
            ),
          ],
        ),
      ),
    );
  }
}
