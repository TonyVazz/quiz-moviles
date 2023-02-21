import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: QuizPage(),
      backgroundColor: Colors.blueGrey,
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> puntuacion = [];
  List<String> preguntas = [
    '¿Los glóbulos rojos viven 4 meses?',
    '¿El cuerpo humano adulto tiene 306 huesos?',
    '¿La cobalamina es una vitamina?',
  ];
  List<bool> respuestas = [
    true,
    false,
    true,
  ];
  int numeroPregunta = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  preguntas[numeroPregunta],
                  style: const TextStyle(fontSize: 20),
                )),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: TextButton(
                    onPressed: (() {
                      setState(() {
                        bool respuestaCorrecta = respuestas[numeroPregunta];
                        if (respuestaCorrecta == true) {
                          print('la respuesta es correcta');
                        } else {
                          print('La respuesta es incorrecta');
                        }

                        numeroPregunta++;

                      
                      });
                    }),
                    child: const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text(
                          'Verdadero',
                          style: TextStyle(color: Colors.white, fontSize: 30),
                        )),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: TextButton(
                    onPressed: (() {
                      setState(() {
                        bool respuestaCorrecta = respuestas[numeroPregunta];
                        if (respuestaCorrecta == true) {
                          print('la respuesta es correcta');
                        } else {
                          print('La respuesta es incorrecta');
                        }
                        numeroPregunta++;
                        puntuacion.add(const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 40,
                        ));
                      });
                    }),
                    child: const Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Center(
                            child: Text('Falso',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 27, 25, 25),
                                    fontSize: 30))),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: puntuacion,
            )
          ],
        ),
      ),
    );
  }

  void comprobar() {

    
  }
}
