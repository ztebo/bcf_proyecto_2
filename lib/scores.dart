class Scores {
  /*
  Clase para guardar puntajes, etiqueta de tiempo y tópico asociado al puntaje. 
  También incluye funciones para registrar nuevos puntajes y ordenar los datos guardados.

  Constructor:
  - score: puntaje obtenido, cantidad de aciertos
  - timeLabel: etiqueta de tiempo
  - topic: índice que hace referencia al tópico asociado al puntaje
  */

  Scores(this.score, this.timeLabel, this.topic);

  int score;
  String timeLabel;
  int topic;

  static List<Scores> scores = [];

  static void addScore(int newScore, int relatedTopic) {
    /*
    Método para crear un nuevo registro con de puntaje obtenido

    Param:
    - newScore: nuevo puntaje obtenido
    - relatedTopic: índice que denota el tópico al que se asocia el puntaje obtenido

    Output:
    Los resultados queda guardados en la variable scores. 
    */

    scores.add(Scores(newScore, _getDateTimeLabel().toString(), relatedTopic));
    scores.sort((a, b) => a.topic.compareTo(b.topic) != 0 ? a.topic.compareTo(b.topic) : b.score.compareTo(a.score));
  }

  static String _getDateTimeLabel() {
    // Método para obtener etiqueta de hora con mes, día, hora y minuto.

    DateTime now = DateTime.now();
    List<String> monthNames = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    String formattedDate = '${monthNames[now.month - 1]}-${now.day.toString().padLeft(2,'0')} – ${now.hour.toString().padLeft(2,'0')}:${now.minute.toString().padLeft(2,'0')}:${now.second.toString().padLeft(2,'0')}';
    return formattedDate;
  }

  static List<Scores> getScores(int relatedTopic) {
    /*
    Retorna el listado de scores para un sólo tópico de acuerdo con el índice ingresado

    Param:
    - relatedTopic: índice que denota el tópico al que se relacionan los puntajes que se quieren obtener

    Output:
    Retorna una lista de tipo Scores que contiene los puntajes para el tópico seleccionado
    */

    return scores.where((s) => s.topic == relatedTopic).toList();
  }


}

