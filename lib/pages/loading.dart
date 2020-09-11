import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:convert/convert.dart';
import 'dart:io';

class Loading extends StatefulWidget {
  @override
  LoadingState createState() => LoadingState();
}

class LoadingState extends State<Loading> {
  List heroNamesList = [];
  Map<String, Map> audioFilesAll = {};

  void setupFiles() async {
    await rootBundle.loadString('assets/heros.txt').then((q) {
      for (String i in LineSplitter().convert(q)) {
        setState(() {
          heroNamesList.add(i);
        });
      }
    });

    File aFile = File(
        '/Users/hoangphanpham/Documents/Projects/Application/dota2_responser/pubspec.yaml');
    for (String i in heroNamesList) {
      await aFile.writeAsString('    - assets/' + i + '/\n',
          mode: FileMode.append, flush: true);
    }

    for (String heroName in heroNamesList) {
      Map<String, String> heroAudio = {};
      await rootBundle
          .loadString('assets/' + heroName + "_list.txt")
          .then((value) async {
        for (String i in LineSplitter().convert(value)) {
          String txt = await rootBundle
              .loadString('assets/' + heroName + "/" + i + ".txt");
          String mp3 = heroName + "/" + i + '.mp3';

          setState(() {
            heroAudio[txt] = mp3;
          });
        }
        setState(() {
          audioFilesAll[heroName] = heroAudio;
        });
      });
    }

    Navigator.pushNamed(context, '/home', arguments: {
      'heroNamesList': heroNamesList,
      'audioFilesMap': audioFilesAll,
    });
  }

  @override
  void initState() {
    super.initState();
    setupFiles();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(100.0),
        child: Text(
          'Loading...',
          style: TextStyle(
            color: Colors.cyan[700],
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
