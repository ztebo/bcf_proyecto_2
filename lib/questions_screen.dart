import 'package:flutter/material.dart';
import 'question_widget.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.question,
    required this.currentScore,
    required this.pathBackground
    }
  );

  final String question;
  final int currentScore;
  final String pathBackground;  

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  Widget build(BuildContext context) {

    // Widget para desplegar la pregunta con los botones y la puntuación actual     
    return Container(        
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.pathBackground),
            fit: BoxFit.fill
          ),
        ),
        child: QuestionWidget(
          question: widget.question,
          currentScore: widget.currentScore,
        )
      );
  }
}

