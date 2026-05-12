// 2311102090-Buswiryawan Raditya Boenyamin
import 'package:flutter/material.dart';

void main() {
  final List<String> entries = <String>['A', 'B', 'C'];

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: entries.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  color: Colors.red[600],
                  child: Center(child: Text('Entry ${entries[index]}')),
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
          ),
      ),
    ),
  );
}