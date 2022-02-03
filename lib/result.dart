import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  String get resultPhrase {
    var resultText = 'You did it';
    if (resultScore <= 6) {
      resultText = 'D';
    } else if (resultScore >= 7 && resultScore < 10) {
      resultText = 'I';
    } else if (resultScore >= 10 && resultScore < 14) {
      resultText = 'S';
    } else if (resultScore >= 14) {
      resultText = 'C';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          children: <Widget>[
            Text(
          resultPhrase,
          style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            TextButton (child: Text('Restart Quiz!'), onPressed: resetHandler),
          ],
        ),
    );
  }
}