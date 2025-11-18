import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const RandomizerApp());
}

class RandomizerApp extends StatelessWidget {
  const RandomizerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Randomizer App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const RandomizerHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class RandomizerHome extends StatefulWidget {
  const RandomizerHome({super.key});

  @override
  State<RandomizerHome> createState() => _RandomizerHomeState();
}

class _RandomizerHomeState extends State<RandomizerHome> {
  final Random _random = Random();
  String _result = 'Tap a button to get started!';

  void _rollDice() {
    int number = _random.nextInt(6) + 1; // 1-6
    setState(() {
      _result = '🎲 You rolled a $number!';
    });
  }

  void _flipCoin() {
    String coin = _random.nextBool() ? 'Heads' : 'Tails';
    setState(() {
      _result = '🪙 You flipped $coin!';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Randomizer App'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _result,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: _rollDice,
                child: const Text('Roll Dice'),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _flipCoin,
                child: const Text('Flip Coin'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
