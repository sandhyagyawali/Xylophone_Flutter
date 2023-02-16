import 'package:flutter/material.dart';
//TODO: Step 2 - Import the rFlutter_Alert package here.
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

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
  List<Icon> scorekeeper = [
    /* Icon(
      Icons.check,
      color: Colors.green,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),
    Icon(
      Icons.close,
      color: Colors.red,
    ),*/
  ];
  int _questionNumber = 0;
  void checkAnswer(bool userPickedAnswer) {
    bool correctAnswer = quizBrain.getCorrectAnswer();
    setState(() {
      //TODO: Step 4 - Use IF/ELSE to check if we've reached the end of the quiz.
      if (quizBrain.isFinished() == true) {
        //TODO Step 4 Part A - show an alert using rFlutter_alert,
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You have reached the end of the quiz.',
        ).show();

        //TODO Step 4 Part C - reset the questionNumber,
        quizBrain.reset();

        //TODO Step 4 Part D - empty out the scoreKeeper.
        scorekeeper = [];
      }
      //TODO: Step 6 - If we've not reached the end, ELSE do the answer checking steps below 👇'
      else if (userPickedAnswer == correctAnswer) {
        scorekeeper.add(Icon(
          Icons.check,
          color: Colors.green,
        ));
      } else {
        scorekeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      quizBrain.nextQuestion();
    });
  }
  /*List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  List<bool> answers = [false, true, true];
*/

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
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
        Container(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(true);
                /*  bool correctAnswer =
                    quizBrain.getQuestionAnswer(_questionNumber);

                if (correctAnswer == true) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });*/
              },
            ),
          ),
          color: Colors.green,
        ),
        Container(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: TextButton(
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(false);
                /* bool correctAnswer =
                    quizBrain.getQuestionAnswer(_questionNumber);

                if (correctAnswer == false) {
                  print('User got it right');
                } else {
                  print('User got it wrong');
                }
                setState(() {
                  quizBrain.nextQuestion();
                });*/
              },
            ),
          ),
          color: Colors.red,
        ),
        Row(
          children: scorekeeper,
        )
        //TODO: Add a Row here as your score keeper
      ],
    );
  }
}
