import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dota2Resp'),
        centerTitle: true,
        backgroundColor: Colors.cyan[600],
      ),
      body: Column(
        children: [
          Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow),
                shape: CircleBorder(
                  side: BorderSide(color: Colors.cyan),
                ),
              ),
              Text('INVOKER'),
            ],
          ),
          Row(
            children: [
              FlatButton(
                onPressed: () {},
                child: Icon(Icons.play_arrow),
                shape: CircleBorder(
                  side: BorderSide(color: Colors.red),
                ),
              ),
              Text('PUCK'),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red[600],
        child: Text('click'),
      ),
    );
  }
}
