import 'package:flutter/material.dart';
import 'package:flutter_quiz/config/styles/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_quiz/data/questions/questions_data.dart';
import 'package:flutter_quiz/presentation/widgets/summary/questions_summary.dart';

class SummaryScreen extends StatelessWidget {
  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  const SummaryScreen({
    super.key,
    required this.chosenAnswers,
    required this.restartQuiz,
  });

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questionsData[i].text,
        'correct_answer': questionsData[i].answers.first,
        'user_answer': chosenAnswers[i],
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questionsData.length;
    final numCorrectQuestions =
        summaryData.where((data) {
          return data['user_answer'] == data['correct_answer'];
        }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'You answered $numCorrectQuestions out of $numTotalQuestions questions correclty!',
              style: appTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            QuestionsSummary(summaryData: getSummaryData()),
            const SizedBox(height: 30),
            TextButton.icon(
              onPressed: restartQuiz,
              icon: const Icon(Icons.refresh, color: Colors.white, size: 22),
              label: Text(
                'Restart Quiz!',
                style: appTextStyle(),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
