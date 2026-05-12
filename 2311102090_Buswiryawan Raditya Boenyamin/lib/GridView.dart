// 2311102090-Buswiryawan Raditya Boenyamin
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
              ),
            ],
          ),
      ),
    ),
  );
}