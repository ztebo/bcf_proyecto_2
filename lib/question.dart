import 'dart:math';

class Question {
  // Declaración del método construtor de la clase
  Question(this.question, this.answer, this.urlImage);

  String question;
  String urlImage;
  String answer;
  
  // Lista de elementos de la clase Question
  static List<Question> questions = [
    Question('Flutter es una librería de Python', 'Falso','null'),
    Question('Un Widget es una función personalizada por el usuario ', 'Falso','null'),
    Question('flutter pub get es un comando para obtener las dependencias del proyecto', 'Verdadero','null')
  ];

  static Question getRandomQuestion() {
    /*
      Método para obtener una pregunta de forma aleatoria, se declara de forma
      estática para poder usar el método sin necesidad de instanciar la clase
    */
    // Se instancia objeto Random para poder crear un número aleatorio
    Random random = Random();
    // Se crea un número aleatorio dentro del rango de los índices de la variable questions
    int index = random.nextInt(questions.length);
    // Retorna una pregunta de la variable questions usando con el índice index
    return questions[index];
  }

}
