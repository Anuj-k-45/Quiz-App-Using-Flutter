import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,{super.key});

  final List<Map<String, Object>> summaryData;
  
  @override
  Widget build(context) {
    return SizedBox(
      height: 375,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {

            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (data["user_answer"]==data["correct_answer"]? const Color.fromARGB(255, 0, 238, 255):Colors.red),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: Text(((data['question_index'] as int) + 1).toString())),
                  const SizedBox(width: 17,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data['question'] as String,
                        style: GoogleFonts.lato(
                          color:Colors.white,
                          fontSize:15,
                        ),
                      ),
                      const SizedBox(height: 5,),
                      Text(data["user_answer"] as String,
                        style: GoogleFonts.lato(
                          color:const Color.fromARGB(255, 221, 134, 255),
                          fontSize:13,
                        ),
                      ),
                      
                      Text(data["correct_answer"] as String,
                        style: GoogleFonts.lato(
                          color:const Color.fromARGB(255, 0, 255, 247),
                          fontSize:13,
                        ),
                      ),
                      const SizedBox(height: 10,),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
