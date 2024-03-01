import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text(
            'Dicee',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDieFaceValue = 1;
  int rightDieFaceValue = 1;

  void shuffle() {
    setState(() {
      leftDieFaceValue = Random().nextInt(6) + 1;
      rightDieFaceValue = Random().nextInt(6) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: TextButton(
              onPressed: () {
                shuffle();
              },
              child: Image.asset('images/dice$leftDieFaceValue.png'),
            ),
          ),
          Expanded(
            child: TextButton(
              onPressed: () {
                shuffle();
              },
              child: Image.asset('images/dice$rightDieFaceValue.png'),
            ),
          ),
        ],
      ),
    );
  }
}
