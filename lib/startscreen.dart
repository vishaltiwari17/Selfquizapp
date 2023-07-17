import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});//void Function () startQuiz
  final void Function () startQuiz ;//variable
  @override//startQuiz is a roop of switchscreen kyuki ham switchscreen ko start screen me pass krrhe h quiz.dart mein
  Widget build(context) {
    return  Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/hehe.png',
            width: 250,//wrap image with opacity to control opacity
            color: const Color.fromARGB(158, 255, 255, 255),
            ),
          const SizedBox(height: 80),
          const Text(
            'How well do you know Vishal ?',
            style: TextStyle(
              color: Color.fromARGB(255, 253, 253, 253),
              fontSize: 20
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton.icon(
            onPressed: startQuiz, 
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color.fromARGB(255, 252, 207, 7)
            ),
            icon: const Icon(Icons.star),
            label:const Text('Start Quiz')),
        ],
      ),
    );
  }
}
