import 'dart:math';

import 'package:flutter/material.dart';

// Number Generator App Assignment Lab 4
class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  _NumberGeneratorScreenState createState() => _NumberGeneratorScreenState();
}

class _NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  int _score = 0;
  int _roundsPlayed = 0;
  int _number1 = 0;
  int _number2 = 0;

  void _generateRandomNumbers() {
    setState(() {
      _number1 = Random().nextInt(100);
      _number2 = Random().nextInt(100);
    });
  }

  void _checkAnswer(bool isGreater) {
    setState(() {
      if ((isGreater && _number1 > _number2) ||
          (!isGreater && _number2 > _number1)) {
        _score++;
      }
      _roundsPlayed++;
      if (_roundsPlayed >= 10) {
        _showGameOverDialog();
        return;
      }
      _generateRandomNumbers();
    });
  }

  void _showGameOverDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Game Over!'),
          content: Text('Your score is $_score.'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _restartGame();
              },
              child: const Text('Restart'),
            ),
          ],
        );
      },
    );
  }

  void _restartGame() {
    setState(() {
      _score = 0;
      _roundsPlayed = 0;
      _generateRandomNumbers();
    });
  }

  @override
  void initState() {
    super.initState();
    _generateRandomNumbers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Pick Greater Number'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Which number is greater?',
              style: TextStyle(fontSize: 40.0),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  '$_number1',
                  style: const TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$_number2',
                  style: const TextStyle(
                      fontSize: 50.0, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => _checkAnswer(true),
                  child: const Text('Number 1'),
                ),
                ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  onPressed: () => _checkAnswer(false),
                  child: const Text('Number 2'),
                ),
              ],
            ),
            const SizedBox(height: 50.0),
            Text(
              'Score: $_score / 10',
              style: const TextStyle(fontSize: 30.0),
            ),
            const SizedBox(height: 50.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: _restartGame,
              child: const Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }
}
