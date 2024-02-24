import 'package:flutter/material.dart';
import 'global.dart' as globals;
import 'widget_question.dart';

/*
Pantalla de bienvenida
*/

class ScreenWelcome extends StatefulWidget {
  const ScreenWelcome({
    super.key,
    required this.pathBackground
    }
  );

  // Variable para guardar ruta de la imagen
  final String pathBackground;

  @override
  State<ScreenWelcome> createState() => _ScreenWelcomeState();
}

class _ScreenWelcomeState extends State<ScreenWelcome> {

  void setNew(int value){    
      globals.modifyTopic(value);
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
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed:() => {setNew(0)},
              child: const Text(
              'Flutter'
              )
            ),
            ElevatedButton(
              onPressed:() => {setNew(1)},
              child: const Text(
              'Cultura latinoamericana'
              )
            ),
            ElevatedButton(
              onPressed:() => {setNew(2)},
              child: const Text(
              'Rock progresivo'
              )
            )
          ],
        )
      );
  }
}

