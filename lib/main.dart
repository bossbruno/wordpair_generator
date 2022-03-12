import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:wordpair_generator/random_words.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple[900]),
      home: RandomWords());


  }
}

