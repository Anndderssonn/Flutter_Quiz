import 'package:flutter/material.dart';
import 'package:flutter_quiz/config/theme/app_background.dart';
import 'package:flutter_quiz/data/questions/questions_data.dart';
import 'package:flutter_quiz/presentation/screens/home/home_screen.dart';
import 'package:flutter_quiz/presentation/screens/questions/questions_screen.dart';
import 'package:flutter_quiz/presentation/screens/summary/summary_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questionsData.length) {
      setState(() {
        activeScreen = 'summary-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
    }

    if (activeScreen == 'summary-screen') {
      screenWidget = SummaryScreen(
        chosenAnswers: selectedAnswers,
        restartQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: AppBackground().background(),
          child: screenWidget,
        ),
      ),
    );
  }
}
