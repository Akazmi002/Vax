import 'package:flutter/material.dart';
import 'package:hack1/home.dart';
import 'package:hack1/loading.dart';
import 'package:hack1/map.dart';
import 'package:hack1/data.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => First(),
      '/home': (context) => Home(),
      '/loading': (context) => Loading(),
    },
  ));
}
