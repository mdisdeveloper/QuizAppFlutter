import 'package:flutter/material.dart';
import 'package:quizapp/answer.dart';

import './question.dart';

// void main() {
//   runApp(QuizApp());
// }

void main() => runApp(QuizApp());

// Can be rebuild
class QuizApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizAppState();
  }
}

// Is persistant
class QuizAppState extends State<QuizApp> {
  final questions = const [
    {
      'questionText': 'What\'s your favourite animal?',
      'answers' : ['Panda', 'Koala', 'Dog'],
    },
    {
      'questionText': 'What\'s your favourite color?',
      'answers' : ['Blue', 'Red', 'Black'],
    },
  ];

  var questionIndex = 0;

  void answerQuestion(){
    setState(() {
      questionIndex = questionIndex + 1;
    });
    if (questionIndex < questions.length){

    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiztionary'),
        ),
        body: questionIndex < questions.length
            ? Column (
            children: [
             Question(
                questions[questionIndex]['questionText'] as String,
              ),
              ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
                return Answer(answerQuestion, answer);
              }).toList()
            ],
          )
            : Center(
          child: Text('you did it'),
        ),
      ),
    );
  }
}