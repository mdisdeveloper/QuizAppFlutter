import 'package:flutter/material.dart';
import 'package:quizapp/result.dart';
import './quiz.dart';
import './result.dart';

// void main() {
//   runApp(QuizApp());
// }

void main() => runApp(QuizApp());

// Can be rebuild
class QuizApp extends StatefulWidget {
  const QuizApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuizAppState();
  }
}

// Is persistent
class QuizAppState extends State<QuizApp> {
  final _questions = const [
    {
      'questionText': 'Do you like coming to the office every morning?',
      'answers' : [
        {'text': 'Absolutely, I enjoy sharing with collages', 'score': 1},
        {'text': 'Yes, I prefer going to the office', 'score': 2},
        {'text': 'I prefer working from home', 'score': 3},
        {'text': 'I find it boring', 'score': 4},
        ],
    },
    {  // for shortage a word use: \' for example,  What\'s
      'questionText': 'Choose one color:',
      'answers' : [
        {'text': 'White', 'score': 3},
        {'text': 'Blue', 'score': 2},
        {'text': 'Green', 'score': 4},
        {'text': 'Black', 'score': 1},
      ],
    },
    {
      'questionText': 'What do you prefer?',
      'answers' : [
        {'text': 'Learn new skills', 'score': 2},
        {'text': 'Enhance your current skills', 'score': 1},
        {'text': 'Refresh your skills from time to time', 'score': 4},
        {'text': 'Compliment your skills with other similar', 'score': 3},
      ],
    },
    {
      'questionText': 'What\'s your favourite car?',
      'answers' : [
        {'text': 'Mercedes', 'score': 1},
        {'text': 'Bmw', 'score': 2},
        {'text': 'Volkswagen', 'score': 3},
        {'text': 'Seat', 'score': 4},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score){
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length){
      print('We have more questions !');
    } else {
      print('No more questions ! ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Quiztionary'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
          answerQuestion: _answerQuestion,
          questionIndex: _questionIndex,
          questions: _questions,
        )
            : Result(_totalScore, _resetQuiz),
        ),
    );
  }
}