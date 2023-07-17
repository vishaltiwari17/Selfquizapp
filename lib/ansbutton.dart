import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
 const AnswerButton({super.key ,required this.ansText,required this.onTap});

  final String ansText;// var
  final void Function () onTap;

  @override
  Widget build(context) {
    return  ElevatedButton(
            onPressed: onTap,
            style:ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 40),
              backgroundColor:const  Color.fromARGB(255, 27, 4, 63),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              foregroundColor: const Color.fromARGB(255, 255, 255, 255)
              ),
            child:Text(ansText , textAlign: TextAlign.center,),
          );
  }
}