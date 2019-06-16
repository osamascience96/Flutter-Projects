import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// function where the program starts 
void main() => runApp(MyApp());


// This class inherits the statelesswidget which makes the whole application a widget
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // variable to store the random word 
    final wordPair = WordPair.random();
    // The function must not return the null
    return MaterialApp(
      home: Scaffold(
        // Scaffold widget that provides the default appBar and the body widget to hold the chikd elements 
        appBar: AppBar(
          title: Text("Welcome to Flutter"),
        ),
        body: Center(
          child: Text(wordPair.asPascalCase),
        ),
      ),
    );
  }
}