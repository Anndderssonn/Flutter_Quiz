import 'package:flutter/material.dart';
import 'package:flutter_quiz/config/theme/app_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: AppBackground().background(),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/quiz-logo.png', width: 300),
              const SizedBox(height: 20),
              const Text(
                'Learn Flutter the fun way!',
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 40),
              OutlinedButton.icon(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: Colors.white, width: 2),
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                icon: const Icon(Icons.arrow_right_alt),
                label: const Text('Start Quiz'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
