import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';
import 'audio_view.dart';

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

  Map<String, String> fileMap = {};
  Map<String, String> audioMap = {};
  List audioNames = [];

  fetchFiles() async {
    await rootBundle
        .loadString('assets/' + heroFolder + '/' + heroFolder + "_list.txt")
        .then((q) {
      for (String i in LineSplitter().convert(q)) {
        String aMp3 = i + ".mp3";
        String aTxt = i + ".txt";
        setState(() {
          fileMap[aMp3] = aTxt;
        });
      }
    });

    String mp3URI = '';
    String mp3Text = '';

    fileMap.forEach((key, value) async {
      final ByteData mp3Data =
          await rootBundle.load('assets/' + heroFolder + '/' + key);
      Directory tempDir = await getTemporaryDirectory();
      File tempFile = new File('${tempDir.path}/' + key);
      await tempFile.writeAsBytes(mp3Data.buffer.asUint8List(), flush: false);
      mp3URI = tempFile.uri.toString();

      mp3Text =
          await rootBundle.loadString('assets/' + heroFolder + '/' + value);

      setState(() {
        audioMap[mp3Text] = mp3URI;
        audioNames.add(mp3Text);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchFiles();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: audioNames.map((q) {
        return AudioView(
          audioText: q,
          audioURI: audioMap[q],
        );
      }).toList()),
    );
  }
}
