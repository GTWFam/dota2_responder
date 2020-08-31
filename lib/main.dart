import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String hero = path.basename('assets/Abadon');

  List data = [];
  fetchFile() async {
    List heros = [];
    await rootBundle.loadString('assets/heros.txt').then((q) {
      for (String i in LineSplitter().convert(q)) {
        heros.add(i);
      }
    });

    setState(() {
      data = heros;
    });
  }

  @override
  void initState() {
    fetchFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dota2Resp'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Column(
            children: data.map((e) {
              return AudioView(audioText: e);
            }).toList(),
          ),
          AudioView(audioText: 'AXE'),
        ]),
      ),
    );
  }
}

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

class Heros extends StatefulWidget {
  final List list;
  Heros({List list}) : this.list = list;
  HerosState createState() => new HerosState(list);
}

class HerosState extends State<Heros> {
  HerosState(this.list);
  List list;

  @override
  Widget build(BuildContext context) {
    List aList = list;
    return ListView.builder(
      itemCount: aList.length,
      itemBuilder: (context, index) {
        var current = aList[index];
        return Column(
          children: [
            Text(current),
          ],
        );
      },
    );
  }
}

class Heros2 extends StatelessWidget {
  List<String> list;
  Heros2({this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (context, index) {
        var current = list[index];
        return Column(
          children: [
            Text(current),
          ],
        );
      },
    );
  }
}
