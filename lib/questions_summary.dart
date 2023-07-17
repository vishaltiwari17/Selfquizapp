import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget{
 const QuestionsSummary (this.summaryData , {super.key});

  final List<Map<String , Object>> summaryData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height : 100,
      child: SingleChildScrollView(//to malke scrollable
       child: Column( children: summaryData.map((data){
          return Row( crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(((data['question-index']as int) +1).toString()),
            const SizedBox(width: 10,),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children : [
                Text(data['question'] as String,style: GoogleFonts.lato(color: const Color.fromARGB(255, 255, 255, 255),fontSize: 8,fontWeight: FontWeight.bold ),),
                const SizedBox(height: 5),
                Text(data['correct-option'] as String , style: const TextStyle(color: Color.fromARGB(255, 27, 156, 1), fontWeight: FontWeight.bold),),
                Text(data['user-answer'] as String ,style: const TextStyle(color: Color.fromARGB(255, 156, 1, 1), fontWeight: FontWeight.bold),)
    
              ]),
            )
          ]);
        }).toList(),
        ),
      ),
    );
  }
}