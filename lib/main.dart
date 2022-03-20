import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = [
    {
      'questionText': "what's your favourite color?",
      'answers': [
        {'text': 'Red', 'score': 10},
        {'text': 'Green', 'score': 5},
        {'text': 'white', 'score': 20},
        {'text': 'black', 'score': 15}
      ]
    },
    {
      'questionText': "what's your favourit animal?",
      'answers': [
        {'text': 'Lion', 'score': 10},
        {'text': 'tiger', 'score': 20},
        {'text': 'Cat', 'score': 15},
        {'text': 'Dog', 'score': 5}
      ]
    },
    {
      'questionText': "Who's your favourit instructor?",
      'answers': [
        {'text': 'Ahmed', 'score': 5},
        {'text': 'Max', 'score': 10},
        {'text': 'Root', 'score': 15},
        {'text': 'Admin', 'score': 20}
      ]
    }
  ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    if (_questionIndex < _questions.length) {
      print('we have more questions');
    } else {
      print("no more questions");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                _questions,
                _answerQuestion,
                _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
