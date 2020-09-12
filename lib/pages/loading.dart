import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    Navigator.pushReplacementNamed(context, '/home', arguments: {
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
