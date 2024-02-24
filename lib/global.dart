library globals;

import 'package:flutter/material.dart';

//variable global para alternar pantalla
int selectedTopicGlobal = 0;

//para modificar el valor de la variable global
void modifyTopic(int value) {
  selectedTopicGlobal = value;
  debugPrint('Valores modificados');
}
