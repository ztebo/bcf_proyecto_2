/*
Widget destinado a desplegar los top 5 puntajes obtenidos para un tópico
determinado.

Constructor:
- indexTopic: índice que hace referencia al tópico cuyos mejores 5 puntajes se quiere desplegar
*/

import 'package:flutter/material.dart';
import 'scores.dart';
import 'question.dart';

class TopScores extends StatefulWidget {
  const TopScores({
    super.key,
    required this.indexTopic
  });

  // Índice del tópico que define la información que se desplegará con el widget
  final int indexTopic;

  @override
  State<TopScores> createState() => _TopScoresState();
}

class _TopScoresState extends State<TopScores> {  

  @override
  Widget build(BuildContext context) {

    // Obtiene listado de Scores que se deben mostrar en el widget según el índice ingresado
    List<Scores> selectedScores = Scores.getScores(widget.indexTopic);

    return Column(
      children: [
        const Text(
          'Top 5 scores',
          style: TextStyle(color: Colors.white),
        ),
        ListView.builder(
          padding: const EdgeInsets.all(8),
          shrinkWrap: true,
          // Ingresa el total de puntajes a desplegar y limita a solo 5 elementos.
          itemCount: selectedScores.isNotEmpty ? (selectedScores.length > 5? 5:selectedScores.length): 1,
          itemBuilder: (context, index) {
            return Center(
              child: selectedScores.isNotEmpty?
              Text(
                // Muestra etiqueta del momento en que se obtuvo el puntaje, asi como el puntaje en formato de porcentaje
                '${index+1}. ${selectedScores[index].timeLabel} --- ${(selectedScores[index].score/Question.questions[widget.indexTopic].length*100).toStringAsFixed(0)}%',
                style: const TextStyle(
                  color: Colors.white                
                ),
              ):
              const Text(
                '',
                style: TextStyle(
                  color: Colors.white
                ),
              )
            );
          }
        ),
      ],
    );
  }
}