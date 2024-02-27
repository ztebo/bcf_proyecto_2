/*
Scaffold para presentar pantalla de bienvenida
*/

import 'package:flutter/material.dart';
import 'package:proyecto2/welcome_widget.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.title});

  // Variable para el título de la app
  final String title;

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
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