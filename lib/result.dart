import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result({
    @required this.totalScore,
    @required this.resetQuiz,
  });

  String get resultPhrase {
    String resultText = 'You did it';

    if (totalScore <= 8) {
      resultText = 'Bro you ok';
    } else if (totalScore <= 12) {
      resultText = 'You\'re good to join the crew';
    } else if (totalScore <= 20) {
      resultText = 'You\'re one of the dudes';
    } else {
      resultText = 'Bro you\'re a legend!';
    }

    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            resultPhrase,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            onPressed: resetQuiz,
            child: Text('Restart Quiz!'),
            textColor: Colors.blue,
          )
        ],
      ),
    );
  }
}
