import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dota2_responser/views/audio_view.dart';

class AudioList extends StatefulWidget {
  AudioList({this.heroFolder});
  final String heroFolder;

  @override
  AudioListState createState() {
    return new AudioListState(heroFolder);
  }
}

class AudioListState extends State<AudioList> {
  AudioListState(this.heroFolder);
  String heroFolder;

  Map<String, String> audioFiles = {};

  void fetchFiles() async {
    await rootBundle
        .loadString('assets/' + heroFolder + "_list.txt")
        .then((value) async {
      for (String i in LineSplitter().convert(value)) {
        String txt = await rootBundle
            .loadString('assets/' + heroFolder + "/" + i + ".txt");
        String mp3 = heroFolder + "/" + i + '.mp3';

        setState(() {
          audioFiles[txt] = mp3;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFiles();
  }

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
