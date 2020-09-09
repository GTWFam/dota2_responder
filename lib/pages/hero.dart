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
    String aString = data['announcer'];
    aString = aString.toUpperCase();
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
                    Text(
                      aString,
                      style: TextStyle(
                        fontSize: 25.0,
                      ),
                    ),
                  ],
                ),
                AudioList(
                  heroFolder: data['announcer'],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
