import 'package:adv_basics/ansbutton.dart';
import 'package:adv_basics/quiz.dart';
import 'package:flutter/material.dart';
import 'package:adv_basics/data/dummy_questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {
const QuestionScreen({super.key,required this.onSelectAnswer});

 final void Function (String answer) onSelectAnswer;

  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {

  var currentQuestionIndex=0;
  void answerQuestion (String TappedAnswer){//tapped answer is a var
    widget.onSelectAnswer(TappedAnswer);
    setState(() {
      currentQuestionIndex ++;
    });
  }

  /*void answerQuestion (){
    
    setState(() {
      currentQuestionIndex ++;
    });
  }
  */
  
  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];// questions naam ka var dusri file me h

    return SizedBox(
      width: double.infinity,//alternative of center
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
             Text(
            currentQuestion.text ,
             style: GoogleFonts.lato(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
              ),
             const SizedBox(height: 30),
                               /*answer//par  isse shuffle nhi hota*/

             ...currentQuestion.getshuffledAnswers().map((answer){//map does not change the original list but shuffle does
                return AnswerButton(
                  ansText: answer,
                  onTap: (){
                    answerQuestion(answer);// is function me ++ vala func h ..so koi bhi answer choose krte hi hum next q pe jump kr jayenge
                  });// ontap me pointer daaldia dunction ka
             }) // dynamically coded answer class accese
            /*AnswerButton(
            ansText: currentQuestion.answers[0],
             onTap: (){}
            ),
            AnswerButton(
            ansText: currentQuestion.answers[1],
             onTap: (){}
            ),
            AnswerButton(
            ansText: currentQuestion.answers[2],
             onTap: (){}
            ),
            AnswerButton(
            ansText: currentQuestion.answers[3],
             onTap: (){}
            ),*/ //---> hard coded answer matching
          ],
        ),
      ),
    );
  }
}