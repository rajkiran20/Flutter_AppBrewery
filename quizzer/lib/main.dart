import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import 'QuizBrain.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreKeepers = List.empty(growable: true);
  QuizBrain quizBrain = QuizBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        buildButton(Colors.green, "True"),
        buildButton(Colors.red, "False"),
        Row(
          children: scoreKeepers,
        )
      ],
    );
  }

  Expanded buildButton(
    MaterialColor color,
    String text,
  ) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateColor.resolveWith((states) => color),
          ),
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
          onPressed: () {
            setState(() {
              if (quizBrain.getCorrectAnswer() == true) {
                scoreKeepers.add(Icon(
                  Icons.check,
                  color: Colors.green,
                ));
              } else {
                scoreKeepers.add(Icon(
                  Icons.close,
                  color: Colors.red,
                ));
              }

              if (quizBrain.isFinished()) {
                Alert(
                  context: context,
                  type: AlertType.info,
                  title: "That's all for today",
                  desc: "You have reached end of the questions for today.",
                  buttons: [
                    DialogButton(
                      child: Text(
                        "COOL",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      onPressed: () => Navigator.pop(context),
                      width: 120,
                    )
                  ],
                ).show();
              } else {
                quizBrain.nextQuestion();
              }
            });
          },
        ),
      ),
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
