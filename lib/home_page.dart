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
  int aciertos = 0;
  List<Icon> puntuacion = [];
  List<String> preguntas = [
    '¿Los glóbulos rojos viven 4 meses?',
    '¿El cuerpo humano adulto tiene 306 huesos?',
    '¿La cobalamina es una vitamina?',
    '¿Los chochos hacen daño?',
    '¿Voy a pasar la materia?',
    'Es bueno hacer ejercicio 7 dias a la semana',
  ];
  List<bool> respuestas = [
    true,
    false,
    true,
    true,
    true,
    false,
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
                  style: const TextStyle(
                    fontSize: 38,
                    color: Colors.white,
                  ),
                )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextButton(
                  onPressed: (() {
                    setState(() {
                      comprobar(true);
                      //numeroPregunta++;
                    });
                  }),
                  child: const Padding(
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(17),
                ),
                child: TextButton(
                  onPressed: (() {
                    setState(() {
                      comprobar(false);
                      //numeroPregunta++;
                    });
                  }),
                  child: const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Center(
                          child: Text('Falso',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30))),
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

  void comprobar(comprobar) {
    bool respuestaCorrecta = respuestas[numeroPregunta];

    if (respuestaCorrecta == comprobar) {
      aciertos++;
      puntuacion.add(const Icon(
        Icons.check,
        color: Colors.green,
        size: 40,
      ));
    } else {
      puntuacion.add(const Icon(
        Icons.close,
        color: Colors.red,
        size: 40,
      ));
    }

    if (respuestas.length - 1 != numeroPregunta) {
      numeroPregunta++;
    } else {
      numeroPregunta = 0;
      setState(() {
        showDialog(context: context, builder: (_) => marcador());
      });
    }
  }

  marcador() {
    return AlertDialog(
      title:
          Text("El marcador final es: $aciertos", textAlign: TextAlign.center),
      content: ElevatedButton(
        child: const Text("Reiniciar"),
        onPressed: () {
          Navigator.pop(context);
          setState(() {
            numeroPregunta = 0;
            aciertos = 0;
            puntuacion.clear();
          });
        },
      ),
    );
  }
}
