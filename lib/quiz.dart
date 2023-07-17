//import 'package:adv_basics/data/dummy_questions.dart';
import 'package:adv_basics/questionscreen.dart';
import 'package:adv_basics/results_screen.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/startscreen.dart';
import 'package:adv_basics/data/dummy_questions.dart';

class Quiz extends StatefulWidget{
  const Quiz({super.key});

  @override
  State<Quiz> createState(){
    return _QuizState();
  }

}
class _QuizState extends State<Quiz>{

  List <String> selectedAnswers =[];//list bna li ans store krne ke liye
  void chooseAnswer (String answer){
    selectedAnswers.add(answer);

    if(selectedAnswers.length == questions.length){// saare answers hone ke baad yaharesult
        setState(() {
         
          activescreen = 'result-screen';
        });
    }
  }

  var activescreen ='start-screen';

   void switchscreen (){
     setState(() {
       activescreen = 'question-screen';// yhi pe store bhi krege ans
       
     });
   } 

   void restartQuiz(){
     setState(() {
       selectedAnswers=[];
       activescreen = 'question-screen';
     });
   }

  @override
  Widget build(context){

   // Widget screenWidget = StartScreen(switchscreen);

   // if(activescreen == 'question-screen') {
     //  screenWidget == const QuestionScreen();
    //}
    

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 70, 5, 175),
                Color.fromARGB(255, 4, 43, 102)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: activescreen == 'start-screen'
                 ? StartScreen(switchscreen)
                 : activescreen == 'question-screen'
                   ? QuestionScreen(onSelectAnswer : chooseAnswer)
                   : ResultScreen(chosenAnswers : selectedAnswers , onRestart :restartQuiz) ,//screenWidget,// ternary expression use for switch screen
        ),// questionscreen me choose answer daala h taaki everytime Questionscreen aye ye func excecute ho
      ),
    );
  }
}
//Widget activescreen = const StartScreen(switchscreen);
  // used widget instead of var
 /*
  INIT METHOD
  Widget? activescreen;
  @override
  void initState() {
    activescreen = StartScreen(switchscreen);
    super.initState();
  }
  void switchscreen (){
    setState(() {
      activescreen = const QuestionScreen();
    });
  }
*/