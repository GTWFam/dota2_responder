import 'package:flutter/material.dart';
import 'package:dota2_responser/pages/home.dart';
import 'package:dota2_responser/pages/hero.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Home(),
      '/hero': (context) => HeroPage(),
    },
  ));
}
