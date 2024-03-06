import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      XylophoneApp(),
    );

class XylophoneApp extends StatelessWidget {
  void playSound(int soundNumber) {
    final player = AudioPlayer();
    player.play(AssetSource('note$soundNumber.wav'));
  }

  Expanded buildKey(Color color, int soundNumber) {
    //expands the TextButton along the main axis of the Column (y-axis)
    return Expanded(
        child: Container(
      margin: EdgeInsets.only(
          left: ((8 - soundNumber) * 10.0),
          top: 0,
          right: ((8 - soundNumber) * 10.0),
          bottom: 0),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: Container(),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            //children stretch across the x-axis
            crossAxisAlignment: CrossAxisAlignment.stretch,
            verticalDirection: VerticalDirection.down,
            children: [
              buildKey(Colors.red, 1),
              buildKey(Colors.orange, 2),
              buildKey(Colors.yellow, 3),
              buildKey(Colors.green, 4),
              buildKey(Colors.teal, 5),
              buildKey(Colors.blue, 6),
              buildKey(Colors.purple, 7),
            ],
          ),
        ),
      ),
    );
  }
}
