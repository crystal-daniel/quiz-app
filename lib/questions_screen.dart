import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.onSelectAnswer});
  final void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  void answerQuestion(selectedAnswer) {
    widget.onSelectAnswer(selectedAnswer);
    setState(
      () {
        currentQuestionIndex++;
      },
    );
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.rubik(
                  color: const Color.fromARGB(255, 131, 215, 231),
                  fontSize: 25),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.getShuffledAnswers().map(
              (answers) {
                return AnswerButton(
                  answers,
                  () {
                    answerQuestion(answers);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
