import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple.shade700,
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

  List<Icon> scoreKeep = [];

  void checkAns(bool userPickedAns) {
    bool correctAns = quizBrain.getAnswer();

    setState(() {
      if (quizBrain.gameOver() == true) {
        Alert(
          context: context,
          title: 'Game Over',
        ).show();
        quizBrain.restart();
        scoreKeep = [];
      } else {
        if (userPickedAns == correctAns) {
          scoreKeep.add(Icon(Icons.check_circle, color: Colors.cyanAccent));
        } else {
          scoreKeep.add(Icon(Icons.cancel, color: Colors.grey));
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Row (
          children: scoreKeep,
        ),
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                  child: FlatButton(
                    child: Image.asset(
                        'images/yes.png'
                    ),
                    onPressed: () {
                      checkAns(true);
                    },
                  ),
              ),
              Expanded(
                  child: FlatButton(
                    child: Image.asset(
                        'images/no.png'
                    ),
                    onPressed: () {
                      checkAns(false);
                    },
                  ),
              ),
            ],
          ),
        ),
        Spacer(flex: 1),
      ],
    );
  }
}
