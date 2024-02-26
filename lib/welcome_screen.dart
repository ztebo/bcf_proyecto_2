import 'package:flutter/material.dart';
import 'package:proyecto2/welcome_widget.dart';



/*
Widget home que contiene Scaffold para construir aplicación.
Para este caso, se usa el body para alternar entre las diferentes pantallas
que se requieren para la aplicación. Las pantallas o menús principales de la app son:
1. Pantalla de bienvenida
2. Pantalla de preguntas
3. Pantalla de resultados

Cada una de estas pantallas se encuentran en custom widgets
*/


class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title});

  // Variable para el título de la app
  final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {


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
      // Se usa widget de bienvenida
      body: const WelcomeWidget(
        pathBackground: "assets/images/fondo4.png",
      ),
    );
  }
}