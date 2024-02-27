class Question {
  // Declaración del método construtor de la clase
  Question(this.question, this.answer, this.urlImage, this.feedback);

  String question;
  String answer;
  String urlImage;  
  String feedback;

  //variable global para alternar pantalla
  static int selectedTopic = 0;
  
  // Lista de elementos de la clase Question de tópico Flutter
  static List<Question> questionsFlutter = [
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

  // Lista de elementos de la clase Question de tópico Cultura latinoamericana
  static List<Question> questionsCultura = [
  Question('El Amazonas es el río más largo de América Latina', 'Verdadero', 'null', 'El río Amazonas es efectivamente el más largo de América Latina, recorriendo varios países de la región.'),
  Question('Machu Picchu se encuentra en Brasil', 'Falso', 'null', 'Machu Picchu, una antigua ciudad inca, se encuentra en Perú, no en Brasil.'),
  Question('El tango es un baile originario de Colombia', 'Falso', 'null', 'El tango es un género musical y un baile con orígenes en Argentina y Uruguay.'),
  Question('La arepa es un plato típico de Venezuela y Colombia', 'Verdadero', 'null', 'La arepa es un alimento de origen precolombino de Venezuela y Colombia, consumido de manera tradicional en ambos países.'),
  Question('Frida Kahlo fue una famosa escritora mexicana', 'Falso', 'null', 'Frida Kahlo fue una pintora mexicana conocida por sus autorretratos inspirados en la naturaleza y la cultura de México.'),
  Question('El español es el único idioma oficial en todos los países latinoamericanos', 'Falso', 'null', 'Aunque el español es predominante, países como Brasil tienen el portugués como idioma oficial, y otros países reconocen lenguas indígenas.'),
  Question('La selva amazónica es la mayor reserva de biodiversidad del mundo', 'Verdadero', 'null', 'La selva amazónica es reconocida por ser la mayor reserva de biodiversidad en el planeta.'),
  Question('Gabriel García Márquez ganó el Premio Nobel de Literatura', 'Verdadero', 'null', 'El escritor colombiano Gabriel García Márquez fue galardonado con el Premio Nobel de Literatura en 1982.'),
  Question('La Ciudad de México se fundó sobre las ruinas de una ciudad maya', 'Falso', 'null', 'La Ciudad de México fue construida sobre las ruinas de Tenochtitlán, la capital del imperio azteca, no maya.'),
  Question('El carnaval de Río de Janeiro es el festival más grande del mundo', 'Verdadero', 'null', 'El carnaval de Río de Janeiro es considerado el festival más grande del mundo, atrayendo a millones de turistas cada año.')
  ];


  // Lista de elementos de la clase Question de tópico Rock progresivo
  static List<Question> questionsRock = [
  Question('Pink Floyd es considerada una banda de rock progresivo', 'Verdadero', 'null', 'Pink Floyd es una de las bandas más icónicas del rock progresivo, conocida por álbumes conceptuales y espectáculos en vivo innovadores.'),
  Question('El álbum "Tommy" de The Who es considerado uno de los primeros óperas rock', 'Verdadero', 'null', 'Tommy, lanzado en 1969, es un hito en el género de ópera rock y un precursor importante del rock progresivo.'),
  Question('Rush es una banda originaria de Alemania', 'Falso', 'null', 'Rush es una banda canadiense, conocida por su música compleja y letras profundas, que ha contribuido significativamente al rock progresivo.'),
  Question('El rock progresivo se caracteriza principalmente por sus letras simples y ritmos repetitivos', 'Falso', 'null', 'El rock progresivo se distingue por su complejidad musical, estructuras poco convencionales y a menudo, letras conceptuales.'),
  Question('Genesis se mantuvo estrictamente dentro del género del rock progresivo a lo largo de su carrera', 'Falso', 'null', 'Aunque Genesis comenzó como una banda de rock progresivo, evolucionaron hacia un sonido más pop y comercial en la década de los 80.'),
  Question('King Crimson lanzó "In the Court of the Crimson King", considerado el primer álbum de rock progresivo', 'Verdadero', 'null', 'In the Court of the Crimson King, lanzado en 1969, es frecuentemente citado como el nacimiento del rock progresivo.'),
  Question('Yes es conocido por su enfoque minimalista en la música', 'Falso', 'null', 'Yes es conocido por su enfoque complejo y técnico hacia la música, característico del rock progresivo.'),
  Question('El álbum "Close to the Edge" de Yes es uno de los álbumes más influyentes en el rock progresivo', 'Verdadero', 'null', 'Close to the Edge, lanzado en 1972, es ampliamente reconocido como uno de los álbumes más innovadores y perdurables del rock progresivo.'),
  Question('La banda Jethro Tull es famosa por incorporar la flauta en el rock progresivo', 'Verdadero', 'null', 'Jethro Tull, liderada por Ian Anderson, es notable por su uso único de la flauta, entre otros instrumentos no tradicionales en el rock.'),
  Question('El rock progresivo declinó en popularidad durante los años 80 con la llegada de la música disco', 'Verdadero', 'null', 'Aunque el rock progresivo vio una disminución en su popularidad con el surgimiento de géneros como la música disco y el new wave, sigue teniendo una base de fans dedicada.')
  ];

  // Lista de nombre de los tópicos de preguntas
  static List<String> topicNames = [
    'Flutter',
    'Cultura Latinoamericana',
    'Rock'
  ];

  // Lista de las rutas de las imágenes de fondo
  static List<String> pathTopicBackgrounds = [
    "assets/images/fondo6.png",
    "assets/images/fondo7.png",
    "assets/images/fondo8.png"
  ];

  // Lista que contiene las 3 listas de preguntas, respuestas y feedback
  static List<List<Question>> questions = [questionsFlutter, questionsCultura, questionsRock];

  //para modificar el valor de la variable global
  static void modifyTopic(int value) {
    /*
    Modifica el valor del tópico seleccionado

    Params:
    - value: índice que se requiere seleccionar

    Output:
    Solo modifica la variable estatica para ser usada desde cualquier parte del código de la aplicación.
    */
    selectedTopic = value;
    //debugPrint('Valores modificados');
  }

}
