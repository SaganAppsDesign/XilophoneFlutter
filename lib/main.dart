import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  Future<void> playSound(int num) async {
    final player = AudioPlayer();
    await player.play(AssetSource('note$num.wav'));
  }

  Expanded buildKey(Color color, int soundNumber, String nota) {
    return Expanded(
      child: TextButton(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(3),
            backgroundColor: MaterialStatePropertyAll<Color>(color),
          ),
          onPressed: () {
            playSound(soundNumber);
          },
          child: Text(
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
            nota,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(Colors.red, 1, "DO"),
              buildKey(Colors.deepOrange, 2, "RE"),
              buildKey(Colors.green, 3, "MI"),
              buildKey(Colors.blueGrey, 4, "FA"),
              buildKey(Colors.blueAccent, 5, "SOL"),
              buildKey(Colors.purpleAccent, 6, "LA"),
              buildKey(Colors.deepPurple, 7, "SI"),
            ],
          ),
        ),
      ),
    );
  }
}
