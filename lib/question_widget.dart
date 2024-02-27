/*
Widget para desplegar la información asociada a la pregunta según tópico seleccionado
El tópico queda fijado en el constructor del widget
*/

import 'package:flutter/material.dart';
import 'package:proyecto2/welcome_screen.dart';
import 'question.dart';
import 'scores.dart';

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
  // Para mentener el conteo de respuestas correctas
  int countCorrect = 0; 

  @override
  Widget build(BuildContext context) {
    
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Primer elemento de la columna para desplegar la pregunta
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Text(
            // Texto para presentar el número de pregunta y la pregunta
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
              child: const Text(
                'Verdadero',
                style: TextStyle(color: Colors.black87),
              )
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => checkAnswer(false),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white),
                minimumSize: MaterialStateProperty.all(const Size(120, 40))
              ),
              child: const Text(
                'Falso',
                style: TextStyle(color: Colors.black87),
              )
            )
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

  void checkAnswer(bool isTrue) {
    /* 
    Método para chequear si la respuesta ingresada es la correcta

    Params:
    - isTrue: índice del tópico en e lque se desea hacer el cambio a la siguiente pregunta

    Output:
    Retorna una variable de tipo boolean que permite indicar si es que se ha llegado
    al fin de las preguntas del tópico seleccionado 
    */
    
    String selectedAnswer = isTrue ? 'Verdadero' : 'Falso';
    String correctAnswer = Question.questions[widget.selectedTopic][questionIndex].answer;
    String feedbackAnswer =  Question.questions[widget.selectedTopic][questionIndex].feedback;
    int countFinal = 0;

    /*
    Despliega cuadro de diálogo presentando feedback sobre la pregunta además
    de mostrar botones contextuales dependiendo de si se ha llegado al final
    de las preguntas del tópico
    */
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(          
          title: Text(
            selectedAnswer == correctAnswer ? '¡Correcto!':'¡Incorrecto!',
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
            ),            
          ),
          // Íconos dinámicos según evaluación de la respuesta
          iconColor: (selectedAnswer == correctAnswer)? Colors.lightGreen:Colors.redAccent,
          icon: (selectedAnswer == correctAnswer)? const Icon(Icons.check_circle):const Icon(Icons.cancel),          
          content: Text(
            feedbackAnswer,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12),
          ),
          actions: [
            TextButton(
              // Lo que sucede al cerrar el cuadro de diálogo
              onPressed: () {
                Navigator.of(context).pop();
                // Compara la respuesta seleccionada con la correcta e 
                // incrementa el contador de preguntas correctas
                // en caso de ser correcta
                if (selectedAnswer == correctAnswer) {      
                  setState(() {
                    countCorrect ++;
                    // Guarda puntaje final
                  });                     
                }
                countFinal = countCorrect;  
                // Utiliza función para pasar el siguiente índice de la
                // lista de preguntas                
                bool restart = switchQuestion(widget.selectedTopic);                
                // En caso de haberse reseteado el contador
                // muestra diálogo indicando el término del cuestionario
                if (restart) {
                  showDialog(
                    context: context,
                    // Propiedad para evitar que el usuario cierre el cuadro de diálogo
                    // si no es usando el botón que incluye
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
                              goHome();                              
                            },
                            style: TextButton.styleFrom(
                              backgroundColor: const Color.fromARGB(20,100, 100, 100)
                            ),
                            child: const Text(
                              'Volver a inicio',
                              style: TextStyle(color: Colors.black87),
                            ),
                          ),
                          TextButton(                            
                            onPressed: () {
                              //Cierra el cuadro de diálogo
                              Navigator.of(context).pop();
                            },
                            style: TextButton.styleFrom(backgroundColor:  const Color.fromARGB(20,100, 100, 100)),
                            child: const Text(
                              'Reiniciar Cuestionario',
                              style: TextStyle(color: Colors.black87),
                            ),
                          )
                        ]
                      );
                    }
                  );
                }
              },
              style: TextButton.styleFrom(backgroundColor:  const Color.fromARGB(20,100, 100, 100)),
              child: const Text(
                'Siguiente pregunta',
                style: TextStyle(color: Colors.black87),
              )
            )
          ],          
        );
      }
    );
  }

  
  bool switchQuestion(int indexTopic) {
    /* 
    Método para pasar al siguiente índice de la lista
    en caso de haber terminado lo resetea
    También se encarga de agregar el puntaje obtenido al registro de la clase Scores

    Params:
    - indexTopic: índice del tópico en e lque se desea hacer el cambio a la siguiente pregunta

    Output:
    Retorna una variable de tipo boolean que permite indicar si es que se ha llegado
    al fin de las preguntas del tópico seleccionado 
    */
    
    if (questionIndex < Question.questions[indexTopic].length - 1) {
      setState(() {
        questionIndex ++;
      });      
    }
    else {
      
      setState(() {
        // Guarda puntaje en ranking top 10
        Scores.addScore(countCorrect, indexTopic);
        questionIndex = 0;
        countCorrect = 0;
      });   
    }
    //Retorna verdadero solo si se ha reseteado el índice
    return questionIndex == 0;
  }

  void goHome(){
    /*
    Volver a pantalla de inicio correspondiente a WelcomeScreen
    */
    
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const WelcomeScreen(title: 'Proyecto 2 - Cuestionario'),
        fullscreenDialog: true,
      ),
    );      
  }

}