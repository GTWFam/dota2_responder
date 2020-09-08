import 'package:flutter/material.dart';
import 'package:audioplayer/audioplayer.dart';

class AudioView extends StatefulWidget {
  AudioView({this.audioText, this.audioURI});
  final String audioText;
  final String audioURI;

  @override
  AudioViewState createState() {
    return new AudioViewState(audioText, audioURI);
  }
}

class AudioViewState extends State<AudioView> {
  AudioViewState(this.audioText, this.audioURI);
  String audioText;
  String audioURI;

  void playSound(String aUri) {
    AudioPlayer player = AudioPlayer();
    player.play(aUri);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        FlatButton(
          onPressed: () {
            playSound(audioURI);
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
