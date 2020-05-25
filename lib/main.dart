import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  void clickMe(int number) {
    final AudioCache player = new AudioCache();
    player.play("note$number.wav");
  }

  Widget buildKey(int number) {
    List<MaterialColor> colors = [
      null,
      Colors.red,
      Colors.orange,
      Colors.purple,
      Colors.yellow,
      Colors.indigo,
      Colors.blue,
      Colors.green
    ];
    return Expanded(
      child: FlatButton(
        color: colors[number],
        onPressed: () {
          clickMe(number);
        },
        child: Text(""),
      ),
    );
  }

  List<Widget> buildWidget(number) {
    List<Widget> widgets = List<Widget>();
    for (var i = 1; i <= number; i++) {
      widgets.add(buildKey(i));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: buildWidget(7),
            ),
          ),
        ),
      ),
    );
  }
}
