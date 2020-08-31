import 'package:flutter/material.dart';

class AudioView extends StatefulWidget {
  AudioView({this.audioText});
  final String audioText;

  @override
  AudioViewState createState() => new AudioViewState(audioText);
}

class AudioViewState extends State<AudioView> {
  AudioViewState(this.audioText);
  String audioText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          FlatButton(
            onPressed: () {},
            child: Icon(Icons.play_arrow),
            shape: CircleBorder(
              side: BorderSide(color: Colors.red),
            ),
          ),
          Text(audioText),
        ],
      ),
    );
  }
}
