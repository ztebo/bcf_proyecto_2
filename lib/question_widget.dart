import 'package:flutter/material.dart';


class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.question,
    required this.currentScore, }
  );

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

    // Widget para desplegar la pregunta con los botones y la puntuación actual     
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Primer elemento de la columna para desplegar la pregunta
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Text(
            widget.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20
            ),
          ),
        ),
        const SizedBox(height: 10),
        // Segundo de la columna para desplegar dos botones
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => checkAnswer(true),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(const Size(120, 40))
              ),
              child: const Text('Verdadero')
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(const Size(120, 40))
              ),
              child: const Text('Falso'))
          ],
        ),
        const SizedBox(height: 10),
        // Tercer elemento de la columna para desplegar el puntaje parcial del cuestionario
        Text(
          'Puntuación actual: ${widget.currentScore}',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        )
      ],
    );
  }


}