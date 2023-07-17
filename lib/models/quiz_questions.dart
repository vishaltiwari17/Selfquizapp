class QuizQuestion{

  const QuizQuestion(this.text ,this.answers);


  final String text;
  final List<String> answers;

  List<String> getshuffledAnswers(){//to shuffle list
   final shuffledlist = List.of(answers);/*to copy list*/
   shuffledlist.shuffle();
   return shuffledlist;
  }
}