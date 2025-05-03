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
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = HomeScreen(switchScreen);
    super.initState();
  }

  void switchScreen() {
    setState(() {
      activeScreen = const QuestionsScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Quiz',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: AppBackground().background(),
          child: activeScreen,
        ),
      ),
    );
  }
}
