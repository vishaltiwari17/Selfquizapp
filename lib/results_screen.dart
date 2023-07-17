import 'package:adv_basics/data/dummy_questions.dart';
import 'package:adv_basics/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';


import 'package:flutter/material.dart';
class ResultScreen extends StatelessWidget{
  const ResultScreen ({super.key , required this.onRestart ,required this.chosenAnswers});
  final void Function () onRestart;
  final List<String> chosenAnswers;
  List<Map<String , Object>> getSummarydata(){
    List<Map<String , Object>> summary =[];

    for(var i=0 ;i < chosenAnswers.length ;i++ ){
      summary.add({
        'question-index' : i ,
        'question':questions[i].text,
        'correct-option':questions[i].answers[0],
        'user-answer':chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context){
    final summaryFinaldata = getSummarydata();
    final numTotalQuestions = questions.length;
    final numCorrectQuestion = summaryFinaldata.where((data){
      return data['user-answer'] == data['correct-option'];
    }).length;// total no. of sahi question find out krne ke liye

    return SizedBox(
      width: double.infinity,//alternative of center
      child: Container(
        margin: const EdgeInsets.all(40),
        child:Expanded(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
     
            children: [
             Text('You have Answered  $numCorrectQuestion  out of  $numTotalQuestions  questions correctly !',style: GoogleFonts.lato(color: const Color.fromARGB(255, 255, 255, 255),fontWeight: FontWeight.bold , fontSize: 18)),
 
             const SizedBox(height: 30),

             QuestionsSummary(summaryFinaldata),//QuestionsSummary(getSummarydata()),
// sumfinaldtata used in line 25 to use getsummarydata func ache se

             const SizedBox(height: 30),
              TextButton.icon(
               onPressed: onRestart,
               label: const Text('Restart Quiz'),
               style: TextButton.styleFrom(foregroundColor: const Color.fromARGB(255, 255, 255, 255)),
              
               icon:const Icon(Icons.refresh)
              
               
              ),
            ],
      ),
        ),
    )
  );

  }
}