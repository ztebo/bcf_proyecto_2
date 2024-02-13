import 'package:flutter/material.dart';
import 'questions_screen.dart';

/*
Widget home que incluye Scaffold para construir aplicación.
Para este caso, se usa el body para alternar entre las diferentes pantallas
que se requieren para la aplicación. Las pantallas o menús principales de la app son:
1. Pantalla de bienvenida
2. Pantalla de preguntas
3. Pantalla de resultados

Cada una de estas pantallas se encuentran en custom widgets
*/


class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key, required this.title});

  // Variable para el título de la app
  final String title;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {

  /*
  Widgets utilizados en el body para alternar entre las
  pantallas de bienvenida, preguntas y resultados
  */


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      /*
      En el body del Scaffold se desplegará un widget que podrá ser el de bienvenida, 
      de preguntas o el de resultados.       
      */
      body: const QuestionScreen(
        question: 'C# es el lenguaje que se usa para crear aplicaciones en Flutter',
        currentScore: 10,
        pathBackground: "assets/images/fondo3.png",
      )
      
    );
  }
}