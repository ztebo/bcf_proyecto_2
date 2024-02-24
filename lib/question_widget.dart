import 'package:flutter/material.dart';
import 'question.dart';
import 'global.dart' as globals;


class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.selectedTopic,

    }
  );

  // variable para indicar cuál es el tópico seleccionado
  final int selectedTopic;
  
  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {

  // Para controlar la pregunta que se utiliza
  int questionIndex = 0;
  // Para controlar el registro de las respuestas
  int countCorrect = 0; 

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
            'Pregunta ${questionIndex+1}: ${Question.questions[widget.selectedTopic][questionIndex].question}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16
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
          'Puntuación actual: $countCorrect',
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 15
          ),
        )
      ],
    );
  }

  //Método para chequear si la respuesta ingresada es la correcta
  void checkAnswer(bool isTrue) {
    //Question actualQuestion = Question.getRandomQuestion();
    String selectedAnswer = isTrue ? 'Verdadero' : 'Falso';
    String correctAnswer = Question.questions[widget.selectedTopic][questionIndex].answer;
    String feedbackAnswer =  Question.questions[widget.selectedTopic][questionIndex].feedback;
    int countFinal = 0;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(          
          title: Text(
            selectedAnswer == correctAnswer ? '¡Correcto!':'¡Incorrecto!',
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 20),            
          ),
          content: Text(
            feedbackAnswer,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          actions: [
            TextButton(
              //Lo que sucede al cerrar el cuadro de diálogo
              onPressed: () {
                Navigator.of(context).pop();
                //Compara la respuesta seleccionada con la correcta e 
                //incrementa el contador de preguntas correctas
                //en caso de ser correcta
                if (selectedAnswer == correctAnswer) {      
                  setState(() {
                    countCorrect ++;
                    //Guarda puntaje final
                    countFinal = countCorrect;         
                  });                     
                }
                //Utiliza función para pasar el siguiente índice de la
                //lista de preguntas                
                bool restart = switchQuestion();                
                //En caso de haberse reseteado el contador
                //muestra diálogo indicando el término del cuestionario
                if (restart) {
                  showDialog(
                    context: context,
                    //Propiedad para evitar que el usuario cierre el cuadro de diálogo
                    //si no es usando el botón que incluye
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text(
                          'Cuestionario terminado',
                          textAlign: TextAlign.center,
                        ),
                        content: Text(
                          'Has completado todas las preguntas obteniendo $countFinal de 10 correctas',
                          textAlign: TextAlign.center,),
                        actions: [
                          TextButton(                            
                            onPressed: () {
                              //Cierra el cuadro de diálogo
                              Navigator.of(context).pop();
                            },
                            child: const Text('Reiniciar Cuestionario'),
                          )
                        ]
                      );
                    }
                  );
                }
              },
              child: const Text('Siguiente pregunta')
            )
          ],          
        );
      }
    );
  }

  /* 
  Método para pasar al siguiente índice de la lista
  en caso de haber terminado lo resetea
  */
  bool switchQuestion() {
    
    if (questionIndex < Question.questionsFlutter.length - 1) {
      setState(() {
        questionIndex ++;
      });      
    }
    else {
      // Guarda puntaje en ranking top 10
      globals.addToRanking(countCorrect);
      setState(() {
        questionIndex = 0;
        countCorrect = 0;
      });   
    }
    //Retorna verdadero solo si se ha reseteado el índice
    return questionIndex == 0;
  }

}