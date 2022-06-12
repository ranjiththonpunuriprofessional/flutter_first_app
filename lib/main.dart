import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

// void main(){
//   runApp(const MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [{'text':'Black','score':10}, {'text':'Red','score':7}, {'text':'Green','score':3}, {'text':'White','score':1},],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [{'text':'Rabbit','score':10}, {'text':'Snake','score':7}, {'text':'Elephant','score':3}, {'text':'Lion','score':1},],
    },
    {
      'questionText': 'What\'s your favorite instructor?',
      'answers': [{'text':'Max','score':10}, {'text':'Maxi','score':7}, {'text':'Macsi','score':3}, {'text':'Macs','score':1},],
    }
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(_questions, _answerQuestion, _questionIndex)
            : Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
