// 2311102090-Buswiryawan Raditya Boenyamin
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              Container(
                margin: const EdgeInsets.all(10.0),
                color: Colors.blue[500],
                width: 25,
                height: 50,
                child: Center(
                  child: Text("Ini view pertama"),
                ),
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