import 'package:flutter/material.dart';

class Question extends StatelessWidget{

  final String questionText;

  // init the question Text to init the text
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      // take the full width of the screen
      width: double.infinity,
      margin: EdgeInsets.all(10),
      // text is as the child of the widget
      child: Text(
        questionText,
        style: TextStyle(fontSize: 20),
        textAlign: TextAlign.center,
      ),
    );
  }
}