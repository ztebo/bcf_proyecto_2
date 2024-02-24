library globals;

import 'package:flutter/material.dart';

//variable global para alternar pantalla
int selectedTopicGlobal = 0;

// Pantalla seleccionada
int activeScreen = 0;

//para modificar el valor de la variable global
void modifyTopic(int value) {
  selectedTopicGlobal = value;
  activeScreen = 1;
  debugPrint('Valores modificados');
}
