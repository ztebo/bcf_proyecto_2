import 'dart:math';

class Question {
  // Declaración del método construtor de la clase
  Question(this.question, this.answer, this.urlImage, this.feedback);

  String question;
  String answer;
  String urlImage;  
  String feedback;
  
  // Lista de elementos de la clase Question
  static List<Question> questions = [
    Question('Dart es el lenguaje de programación utilizado por Flutter', 'Verdadero', 'null', 'Dart es efectivamente el lenguaje de programación diseñado para la creación de aplicaciones móviles y web con Flutter.'),
    Question('Flutter es únicamente para el desarrollo de aplicaciones móviles', 'Falso', 'null', 'Flutter también se utiliza para desarrollar aplicaciones web y de escritorio, no solo móviles.'),
    Question('Hot reload permite ver los cambios en el código en tiempo real sin reiniciar la aplicación', 'Verdadero', 'null', 'Hot reload es una característica de Flutter que ayuda a los desarrolladores a ver los cambios casi instantáneamente.'),
    Question('Widgets en Flutter son inmutables y no pueden cambiar su estado', 'Falso', 'null', 'Aunque los widgets son inmutables, Flutter utiliza widgets Stateful para manejar cambios de estado.'),
    Question('MaterialApp es un widget en Flutter que no permite implementar Material Design', 'Falso', 'null', 'MaterialApp es precisamente el widget que permite implementar Material Design en las aplicaciones Flutter.'),
    Question('El widget Scaffold se utiliza para implementar la estructura básica de diseño visual para la app', 'Verdadero', 'null', 'Scaffold ofrece una estructura básica con elementos como AppBar, Drawer, BottomNavigationBar, etc.'),
    Question('Flutter no soporta el desarrollo de plugins para extender sus capacidades', 'Falso', 'null', 'Flutter permite y alienta la creación de plugins para añadir funcionalidades extra a las aplicaciones.'),
    Question('setState() se utiliza para modificar el estado de un widget Stateful', 'Verdadero', 'null', 'setState() notifica al framework que el estado de un widget ha cambiado, provocando su redibujado.'),
    Question('Flutter es desarrollado y mantenido por Apple', 'Falso', 'null', 'Flutter es un proyecto de código abierto desarrollado y mantenido por Google.'),
    Question('Un ThemeData en Flutter se utiliza para compartir colores y estilos de fuente a través de una aplicación', 'Verdadero', 'null', 'ThemeData permite definir temas globales que se pueden utilizar en toda la aplicación.')
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
