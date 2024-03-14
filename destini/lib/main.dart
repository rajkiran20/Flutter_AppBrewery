import 'package:destini/StoryBrain.dart';
import 'package:flutter/material.dart';

void main() => runApp(const Destini());

class Destini extends StatelessWidget {
  const Destini({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/background.png'), fit: BoxFit.cover),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: DestiniPage(),
            ),
          ),
        ),
      ),
    );
  }
}

class DestiniPage extends StatefulWidget {
  const DestiniPage({super.key});

  @override
  State<DestiniPage> createState() => _DestiniPageState();
}

class _DestiniPageState extends State<DestiniPage> {
  final StoryBrain _storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 6,
          child: Center(
            child: Text(
              _storyBrain.getStory() ?? "Story text will go here",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateColor.resolveWith((states) => Colors.red),
            ),
            child: Text(
              _storyBrain.getChoice1() ?? "Choice 1",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
            onPressed: () {
              setState(() {
                _storyBrain.nextStory(1);
              });
            },
          ),
        ),
        SizedBox(
          height: 20,
        ),
        if (_storyBrain.shouldShowButton()) ...[
          Expanded(
            flex: 1,
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue),
              ),
              child: Text(
                _storyBrain.getChoice2() ?? "Choice 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                setState(() {
                  _storyBrain.nextStory(2);
                });
              },
            ),
          )
        ],
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}

/*

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
*/
