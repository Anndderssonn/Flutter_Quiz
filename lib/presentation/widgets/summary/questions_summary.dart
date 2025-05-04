import 'package:flutter/material.dart';
import 'package:flutter_quiz/config/styles/text_style.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  final List<Map<String, Object>> summaryData;

  const QuestionsSummary({super.key, required this.summaryData});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: SingleChildScrollView(
        child: Column(
          children:
              summaryData.map((data) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          radius: 15,
                          backgroundColor:
                              data['user_answer'] == data['correct_answer']
                                  ? Colors.green
                                  : Colors.pinkAccent,
                          child: Text(
                            ((data['question_index'] as int) + 1).toString(),
                            style: appTextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data['question'] as String,
                              style: appTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              data['user_answer'] as String,
                              style: appTextStyle(
                                color: Colors.amber,
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              data['correct_answer'] as String,
                              style: appTextStyle(
                                color: Colors.cyanAccent,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}
