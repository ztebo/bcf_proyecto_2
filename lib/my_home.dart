import 'package:flutter/material.dart';
import 'questions_screen.dart';
import 'question.dart';

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

  // Rutas de las imágenes que se podrían usar para el fondo de los Scaffold
  List<String> backgrounds = const [
    "assets/images/fondo1.png",
    "assets/images/fondo2.png",
    "assets/images/fondo3.png",
  ];

  /*
  Widgets utilizados en el body para alternar entre las
  pantallas de bienvenida, preguntas y resultados
  borrar este comentario
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
      body: QuestionScreen(
        pathBackground: backgrounds[2],
      )
      
    );
  }
}