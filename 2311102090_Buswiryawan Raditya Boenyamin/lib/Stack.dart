// 2311102090-Buswiryawan Raditya Boenyamin
import 'package:flutter/material.dart';

void main() {
  final List<String> entries = <String>['A', 'B', 'C'];

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Stack(
            children: <Widget>[
              Container(
                width: 100,
                height: 100,
                color: Colors.red,
              ),
              Container(
                width: 90,
                height: 90,
                color: Colors.green,
              ),
              Container(
                width: 80,
                height: 80,
                color: Colors.blue,
              ),
            ],
          ),
      ),
    ),
  );
}