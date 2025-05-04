import 'package:flutter/material.dart';
import 'package:flutter_quiz/config/theme/app_background.dart';
import 'package:flutter_quiz/presentation/screens/home/home_screen.dart';
import 'package:flutter_quiz/presentation/screens/questions/questions_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  final List<String> selectedAnswers = [];
  var activeScreen = 'home-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = HomeScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(onSelectAnswer: chooseAnswer);
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
