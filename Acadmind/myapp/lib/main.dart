import 'package:flutter/material.dart';
import 'package:myapp/answer.dart';
import 'package:myapp/question.dart';

/*void main(){
  runApp(MyApp());
}*/

// function that contains only one line of code in dart
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp>{
  var _questionIndex = 0;

  final questions = const [
      {
        "question":"What's your favourate Color?",
        "answer": ["Red", "Green", "Blue", "Yellow", "White"]
      },
      {
        "question":"Who's your favourate Actress?",
        "answer": ["Emma Watson", "Ashley Green", "Alexandra Daddario", "Mahira Khan"]
      },
      {
        "question":"Favourate Scientists?",
        "answer": ["Ibn-Haytam", "Einstien", "Dr.Abdus Salam", "Dr.Parwez Hoodboy", "Dr.Osama Ahmed"]
      },
      {
        "question":"Who's your Favourate Model?",
        "answer": ["Kylie Jenner", "Kylie Page", "Lana Rhodes", "Dani Daniels", "Tori Black"]
      }
    ];

  void _answerQuestion(){
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      home: Scaffold(  
        appBar: AppBar(title: Text('My First App')),
        // check if the size of the list exceeds, then show something else
        body: (_questionIndex < questions.length) ? Column(children: [
          // the constructor to be called everytime, when the state changes or the setState method is called
          Question(questions[_questionIndex]["question"]),
          // using the spread operator to expose the elements of the list at runtime...
          ...(questions[_questionIndex]["answer"] as List<String>).map((answer){
            return Answer(_answerQuestion, answer);
          })
        ],) : Center(child: Text("You did it!"),)
      )
    );
  }
}