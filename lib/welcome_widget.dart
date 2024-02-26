import 'package:flutter/material.dart';
import 'package:proyecto2/question.dart';
import 'package:proyecto2/question_screen.dart';
import 'top_scores_widget.dart';



/*
Pantalla de bienvenida
*/

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({
    super.key,
    required this.pathBackground
    }
  );

  // Variable para guardar ruta de la imagen
  final String pathBackground;

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {

  void setNew(int value){    
    Question.modifyTopic(value);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => QuestionScreen(
          title: Question.topicNames[Question.selectedTopic],
          pathBackground: Question.pathTopicBackgrounds[Question.selectedTopic],
          ),
        fullscreenDialog: true,
      ),
    );      
  }

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
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
                  'Seleccionar Tópico',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                  ),
                ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed:() => {setNew(0)},
              child: const Text(
              'Flutter'
              )
            ),
            const TopScores(indexTopic: 0),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed:() => {setNew(1)},
              child: const Text(
              'Cultura latinoamericana'
              )
            ),
            const TopScores(indexTopic: 1),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed:() => {setNew(2)},
              child: const Text(
              'Rock progresivo'
              )
            ),
            const TopScores(indexTopic: 2), 
          ]
        )        
    );    
  }
}



