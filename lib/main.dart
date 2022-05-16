import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  var _pergunta_selecionada = 0;

  void _responder() {
    setState(() {
      _pergunta_selecionada = _pergunta_selecionada + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List perguntas = [
      {
        "texto": "Qual é o seu super-herói favorito?",
        "respostas": ["Homem-aranha", "Doutor Estranho", "Batman", "Thor"]
      },
      {
        "texto": "Qual é a sua saga favorita?",
        "respostas": [
          "Saga Harry Potter",
          "Saga Senhor dos Anéis",
          "Saga Star Wars",
          "Saga Jogos Vorazes"
        ]
      },
      {
        "texto": "Qual é o seu filme favorito?",
        "respostas": [
          "Homem-aranha: Sem volta pra casa",
          "Doutor Estranho no multiverso da loucura",
          "Vingadores - Ultimato",
          "The Batman"
        ]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: Column(
          children: <Widget>[
            Questao(perguntas[_pergunta_selecionada]["texto"]),
            Resposta("Resposta 01", _responder),
            Resposta("Resposta 02", _responder),
            Resposta("Resposta 03", _responder),
            //ElevatedButton = RaisedButton
          ],
        ),
      ),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
