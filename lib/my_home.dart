import 'package:flutter/material.dart';
import 'question_widget.dart';

/*
Widget home que incluye Scaffold para construir aplicación
*/


class MyHome extends StatefulWidget {
  const MyHome({super.key, required this.title});

  // Variable para el título de la app
  final String title;

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        centerTitle: true,
        title: Text(
          widget.title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      // Se instancia custom widget hecho para las preguntas
      body: const QuestionWidget(
        question: 'C# es el lenguaje que se usa para crear aplicaciones en Flutter',
        currentScore: 10)
      
    );
  }
}