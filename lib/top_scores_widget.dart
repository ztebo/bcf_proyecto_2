import 'package:flutter/material.dart';
import 'scores.dart';
import 'question.dart';


class TopScores extends StatefulWidget {
  const TopScores({
    super.key,
    required this.indexTopic
  });

  final int indexTopic;

  @override
  State<TopScores> createState() => _TopScoresState();
}

class _TopScoresState extends State<TopScores> {  

  @override
  Widget build(BuildContext context) {

    // Obtiene listado de Scores que se deben mostrar en el widget
    
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
          itemCount: selectedScores.isNotEmpty ? (selectedScores.length > 5? 5:selectedScores.length): 1,
          itemBuilder: (context, index) {
            return Center(
              child: selectedScores.isNotEmpty?
              Text(
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