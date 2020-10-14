import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answer': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 6},
        {'text': 'Green', 'score': 3},
        {'text': 'Yellow', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answer': [
        {'text': 'Dog', 'score': 10},
        {'text': 'Cat', 'score': 6},
        {'text': 'Turtle', 'score': 3},
        {'text': 'Bird', 'score': 1}
      ],
    },
    {
      'questionText': 'What\'s your favorite season?',
      'answer': [
        {'text': 'Winter', 'score': 10},
        {'text': 'Autumn', 'score': 6},
        {'text': 'Spring', 'score': 3},
        {'text': 'Summer', 'score': 1}
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _answersHandler(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex += 1;
    });

    print('Answer Choosed!');
    print(_totalScore);
  }

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answersHandler: _answersHandler,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(
                totalScore: _totalScore,
                resetQuiz: _resetQuiz,
              ),
      ),
    );
  }
}
