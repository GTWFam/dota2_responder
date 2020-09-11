import 'package:dota2_responser/views/audio_list.dart';
import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = ModalRoute.of(context).settings.arguments;
    String heroName = data['announcer'];
    Map<String, String> audioFiles = data['heroAudioFiles'];
    heroName = heroName.toUpperCase();
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcer'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
        child: Scrollbar(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        heroName,
                        style: TextStyle(
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
                AudioList(
                  audioFiles: audioFiles,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
