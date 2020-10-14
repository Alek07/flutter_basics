import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final int questionIndex;
  final Function answersHandler;

  Quiz({
    @required this.questions,
    @required this.answersHandler,
    @required this.questionIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Question(
          questions[questionIndex]['questionText'],
        ),
        ...(questions[questionIndex]['answer'] as List<Map<String, Object>>).map((ans) {
          return Answer(() => answersHandler(ans['score']), ans['text']);
        }).toList()
      ],
    );
  }
}
