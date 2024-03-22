import 'package:adv_basics/data/questions.dart';
import 'package:adv_basics/questions_screen.dart';
import 'package:adv_basics/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/start_screen.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});
  
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz>{
  List<String> selectedAnswers=[];

  Widget? activeScreen;      //using var activeScreen will make the varible of the type StartScreen and then there will be restriction that it can only store variables of the type startScreen
  //                           Passing switchScreen function so that it can be used in the startScreen class or you can say page!
  
  void chooseAnswer(String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length==questions.length){
      setState(() {
        activeScreen=ResultScreen(chooseAnswers: selectedAnswers,onRestart: restartQuiz,);
      });
    }
  }

  @override                  //The question mark after the widget word states that the widget is null for now
  void initState(){                          //used because initialization and defination of both the activeScreen and switchScreen occure at the same time and consist of each other
    activeScreen=StartScreen(switchScreen);  //This init function can be avoided if you use "if" condition, follow these steps : initialize activescreen="startscreen" and change this value in the switchscreen function as activeScreen="quizScreen"; now where you were calling the activeScreen variable in the child widget, use ternary operation as activeScreen=="startScreen"? StartScreen() : QuizScreen();  
    super.initState();                       
  }

  switchScreen() {                                    
    setState(() {
      activeScreen=QuestionsScreen(onSelectAnswer:chooseAnswer);
    });
  }

  void restartQuiz(){
    setState(() {
      selectedAnswers=[];
      activeScreen=StartScreen(switchScreen);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(255, 62, 7, 114),
                Color.fromARGB(255, 121, 60, 196)
              ]
            )
          ),
          child: activeScreen,
        ),
      ),
    );
  }
}