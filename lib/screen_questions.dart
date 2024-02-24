import 'package:flutter/material.dart';
import 'widget_question.dart';

/*
Pantalla para desplegar una pregunta 
*/

class ScreenQuestions extends StatefulWidget {
  const ScreenQuestions({
    super.key,
    required this.pathBackground,
    required this.selectedTopic
    }
  );

  // Variable para guardar ruta de la imagen
  final String pathBackground;  
  // Variable para indicar cual es el tópico seleccionado
  final int selectedTopic;

  @override
  State<ScreenQuestions> createState() => _ScreenQuestionsState();
}

class _ScreenQuestionsState extends State<ScreenQuestions> {


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
        child: WidgetQuestion(selectedTopic: widget.selectedTopic)
      );
  }
}

