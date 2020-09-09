import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:dota2_responser/views/audio_controller.dart';

class AudioView extends StatefulWidget {
  AudioView({this.audioText, this.audioUrl});
  final String audioText;
  final String audioUrl;

  @override
  AudioViewState createState() {
    return new AudioViewState(audioText, audioUrl);
  }
}

class AudioViewState extends State<AudioView> {
  AudioViewState(this.audioText, this.audioUrl);
  String audioText;
  String audioUrl;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            AudioController.play(audioUrl);
          },
          child: Icon(Icons.play_arrow),
          shape: CircleBorder(
            side: BorderSide(color: Colors.red),
          ),
        ),
        Expanded(child: Text(audioText)),
      ],
    );
  }
}
