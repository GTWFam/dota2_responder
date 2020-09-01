import 'package:dota2_responser/announcer_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart' as path;
import 'dart:convert';

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
        i = i.toUpperCase();
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
              return AnnouncerView(text: e);
            }).toList(),
          ),
        ]),
      ),
    );
  }
}
