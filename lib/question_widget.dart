import 'package:flutter/material.dart';


class QuestionWidget extends StatefulWidget {
  const QuestionWidget({super.key, required this.question, required this.currentScore});


  final String question;
  final int currentScore;
  

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {


  // Función para chequear si la respuesta ingresada es la correcta
  void checkAnswer(bool isTrue) {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(        
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: Text(
                widget.question,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black, fontSize: 20
                ),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => checkAnswer(true),
                  child: const Text('Verdadero')
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => checkAnswer(false),
                  child: const Text('Falso'))
                
              ],
            ),
            const SizedBox(height: 10),
            Text('Puntuación actual: ${widget.currentScore}')
          ],
        ),
      );
  }


}

