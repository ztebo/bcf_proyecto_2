library globals;

import 'package:flutter/material.dart';

//variable global para alternar pantalla
int selectedTopicGlobal = 0;

//para modificar el valor de la variable global
void modifyTopic(int value) {
  selectedTopicGlobal = value;
  debugPrint('Valores modificados');
}

// Lista para guardar los mejores 10 resultados
List<int> topTen = [];

// Función para agregar puntajes
void addToRanking(int value) {
  topTen.add(value);
  topTen.sort((a, b) => b.compareTo(a));

  if (topTen.length > 10) {
    topTen.removeLast();
  }

  debugPrint('Valor $value agregado a la lista');
}
