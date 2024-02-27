/*
Scaffold para presentar el widget de preguntas.
En el constructor de la clase se permite el ingreso de la ruta de la imagen que
será utilizada de fondo.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:proyecto2/welcome_screen.dart';
import 'question_widget.dart';
import 'question.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({
    super.key,
    required this.title,
    required this.pathBackground
  });

  // Variable para el título de la app
  final String title;
  final String pathBackground;

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  @override
  Widget build(BuildContext context) {    
        
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
      // Se usa widget de bienvenida
      body: Container(        
        alignment: Alignment.center,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.pathBackground),
            fit: BoxFit.fill
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: QuestionWidget(
                selectedTopic: Question.selectedTopic
              )
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: IconButton(
                onPressed: goHome,
                color: Colors.white,
                icon: const Icon(
                  Icons.home,
                  size: 50,
                )                  
              ),
            )
          ]
        )
      )
    );  }


  void goHome(){
    // volver a pantalla de inicio correspondiente a WelcomeScreen
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => const WelcomeScreen(title: 'Proyecto 2 - Cuestionario'),
        fullscreenDialog: true,
      ),
    );      
  } 
}