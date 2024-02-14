import 'package:flutter/material.dart';
import 'question_widget.dart';
import 'question.dart';


class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.pathBackground
    }
  );

  // Variable para guardar ruta de la imagen
  final String pathBackground;  

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {


  @override
  Widget build(BuildContext context) {

    // Instanciar objeto  de la clase Question
    // Question selectedQuestion = Question.questions[questionIndex];

    // Widget para desplegar la pregunta con los botones y la puntuación actual     
    return Container(        
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.pathBackground),
            fit: BoxFit.fill
          ),
        ),
        child: const QuestionWidget()
      );
  }
}

