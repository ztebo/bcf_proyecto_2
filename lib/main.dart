import 'package:flutter/material.dart';
import 'my_home.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Proyecto 2 - Cuestionario',

      theme: ThemeData(
        fontFamily: 'Montserrat',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        useMaterial3: true
      ),
      home: const MyHome(title: 'Proyecto 2 - Cuestionario',)
    );
    
  }
}

