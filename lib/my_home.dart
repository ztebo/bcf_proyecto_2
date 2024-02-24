import 'package:flutter/material.dart';
import 'package:proyecto2/screen_welcome.dart';
import 'screen_questions.dart';
import 'global.dart' as globals;

/*
Widget home que contiene Scaffold para construir aplicación.
Para este caso, se usa el body para alternar entre las diferentes pantallas
que se requieren para la aplicación. Las pantallas o menús principales de la app son:
1. Pantalla de bienvenida
2. Pantalla de preguntas
3. Pantalla de resultados

Cada una de estas pantallas se encuentran en custom widgets
*/


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  // Variable para el título de la app
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  //int _activeScreen = 0;

  void gotoScreen(int index) {
    setState(() {
      //_activeScreen = index;
      globals.activeScreen = index;
    });
    
  }

  // Rutas de las imágenes que se podrían usar para el fondo de los Scaffold
  List<String> backgrounds = const [
    "assets/images/fondo3.png",
    "assets/images/fondo4.png",
    "assets/images/fondo5.png",
  ];  

  /*
  Widgets utilizados en el body para alternar entre las
  pantallas de bienvenida, preguntas y resultados
  borrar este comentario
  */



  @override
  Widget build(BuildContext context) {    

    // Lista de widgets que se usan en el body del Scaffold
    List<Widget> screens =  [
      ScreenWelcome(
        pathBackground: backgrounds[0],
      ),
      ScreenQuestions(
        pathBackground: backgrounds[1],
        selectedTopic: globals.selectedTopicGlobal,
      )
    ];
    
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
      de preguntas o de resultados.       
      */
      body: Stack(
        children: [
          screens[globals.activeScreen],
          Positioned(bottom: 60, child: ElevatedButton(onPressed: () => {setState(() {globals.modifyTopic(2);})  }, child: const Text('test'))) ,
          
        ],
      ),        
    );
  }
}