//import 'package:flutter/material.dart';

// Clase para guardar puntajes, etiqueta de tiempo y tópico asociado al puntaje
class Scores {

  Scores(this.score, this.timeLabel, this.topic);

  int score;
  String timeLabel;
  int topic;

  static List<Scores> scores = [];

  static void addScore(int newScore, int relatedTopic) {
    scores.add(Scores(newScore, _getDateTimeLabel().toString(), relatedTopic));
    scores.sort((a, b) => a.topic.compareTo(b.topic) != 0 ? a.topic.compareTo(b.topic) : b.score.compareTo(a.score));
    //while (scores.length > 5) {
    //    scores.removeAt(scores.length - 1);
    //}
  }

  // Método para obtener etiqueta de hora
  static String _getDateTimeLabel() {
    DateTime now = DateTime.now();
    List<String> monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    String formattedDate = '${monthNames[now.month - 1]}-${now.day.toString().padLeft(2,'0')} – ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}';
    return formattedDate;
  }

  static List<Scores> getScores(int relatedTopic) {
    // retorna el listado de scores y su etiqueta que coinciden con el topico seleccionado
    return scores.where((s) => s.topic == relatedTopic).toList();
  }


}

