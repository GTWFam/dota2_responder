import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AnnouncerView extends StatelessWidget {
  String text;
  AnnouncerView({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Icon(Icons.accessibility_new),
                SizedBox(width: 10.0),
                Text(
                  text,
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
