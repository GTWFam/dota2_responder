import 'package:dota2_responser/views/announcer_view.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  List heroNames = [];
  Map<String, Map> audioFilesAll = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    heroNames = data['heroNamesList'];
    audioFilesAll = data['audioFilesMap'];
    return Scaffold(
      appBar: AppBar(
        title: Text('Dota2Resp'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: heroNames.map((name) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/hero', arguments: {
                      'announcer': name,
                      'heroAudioFiles': audioFilesAll[name],
                    });
                  },
                  child: AnnouncerView(text: name),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
