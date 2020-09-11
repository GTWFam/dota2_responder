import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dota2_responser/views/audio_view.dart';

class AudioList extends StatefulWidget {
  AudioList({this.audioFiles});
  final Map<String, String> audioFiles;

  @override
  AudioListState createState() {
    return new AudioListState(audioFiles);
  }
}

class AudioListState extends State<AudioList> {
  AudioListState(this.audioFiles);
  Map<String, String> audioFiles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: audioFiles.keys.map((e) {
        return AudioView(
          audioText: e,
          audioUrl: audioFiles[e],
        );
      }).toList(),
    );
  }
}
