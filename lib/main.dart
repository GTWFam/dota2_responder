import 'package:dota2_responser/pages/loading.dart';
import 'package:flutter/material.dart';
import 'package:dota2_responser/pages/home.dart';
import 'package:dota2_responser/pages/hero.dart';

void main() async {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/hero': (context) => HeroPage(),
    },
  ));
}
