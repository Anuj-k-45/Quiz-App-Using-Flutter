import 'package:flutter/material.dart';

class QuizQuestion{
  const QuizQuestion(this.text,this.answers);

  final String text;
  final List<String> answers;

  List<String> getShuffledAnswers(){
    final shuffledList=List.of(answers);       //we are just creating a copy of the answers list because if we shuffle the answers list directly then the orignal list will get shuffled and the correct answers that we know is the first one in all the questions would get mixed and we will never be able to to get it
    shuffledList.shuffle();
    return shuffledList;
  }
}