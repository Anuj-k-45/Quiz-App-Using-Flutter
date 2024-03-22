import 'package:flutter/material.dart';
import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key,required this.chooseAnswers,required this.onRestart});

  final List<String> chooseAnswers;
  final void Function() onRestart;

  List<Map<String,Object>> getSummaryData(){
    final List<Map<String,Object>>summary=[];

    for(var i=0;i<chooseAnswers.length;i++){
      summary.add({
         "question_index":i,
         "question":questions[i].text,
         "correct_answer":questions[i].answers[0],
         "user_answer":chooseAnswers[i],
      });
    }

    return summary;
  }

  @override
  Widget build(context) {

    final summaryData=getSummaryData();
    final numTotalQuestions=questions.length;
    final numCorrectQuestions=summaryData.where((data){
      return data['user_answer']==data['correct_answer'];
    }).length;

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You answered $numCorrectQuestions out of $numTotalQuestions answers correctly!",
            textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize:20,
                color:Colors.white,
                fontWeight:FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(height: 30),
            TextButton.icon(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              onPressed: onRestart,
              icon:const Icon(Icons.refresh),
              label: const Text("Restart Quiz"),
            ),
          ],
        ),
      ),
    );
  }
}
