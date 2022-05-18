import 'package:flutter/material.dart';
import 'package:projeto_perguntas/questionario.dart';
import './resultado.dart';

main() => runApp(PerguntaApp());

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

class _PerguntaAppState extends State<PerguntaApp> {
  final List _perguntas = const [
    {
      "texto": "Qual é o seu super-herói favorito?",
      "respostas": [
        {"texto": "Homem-aranha", "nota": 10},
        {"texto": "Doutor Estranho", "nota": 8},
        {"texto": "Batman", "nota": 5},
        {"texto": "Thor", "nota": 1},
      ]
    },
    {
      "texto": "Qual é a sua saga favorita?",
      "respostas": [
        {"texto": "Saga Harry Potter", "nota": 10},
        {"texto": "Saga Senhor dos Anéis", "nota": 8},
        {"texto": "Saga Star Wars", "nota": 5},
        {"texto": "Saga Jogos Vorazes", "nota": 1},
      ]
    },
    {
      "texto": "Qual é o seu filme favorito?",
      "respostas": [
        {"texto": "Homem-aranha: Sem volta pra casa", "nota": 10},
        {"texto": "Vingadores - Ultimato", "nota": 8},
        {"texto": "Doutor Estranho no multiverso da loucura", "nota": 5},
        {"texto": "The Batman", "nota": 1},
      ]
    }
  ];

  var _pergunta_selecionada = 0;
  bool get sim_pergunta_selecionada {
    return _pergunta_selecionada < _perguntas.length;
  }


  var _nota_total = 0;
  void _responder(int nota) {
    if (sim_pergunta_selecionada) {
      setState(() {
        _pergunta_selecionada = _pergunta_selecionada + 1;
        _nota_total = _nota_total + nota;
      });
    }
    print(_nota_total);
  }

  void _reiniciar_perguntas() {
    setState(() {
      _pergunta_selecionada = 0;
      _nota_total = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    /*
    for (String texto_resposta in respostas) {
      widgets.add(Resposta(texto_resposta, _responder));
    }
    */

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Perguntas"),
        ),
        body: sim_pergunta_selecionada
            ? Questionario(
                perguntas: _perguntas,
                pergunta_selecionada: _pergunta_selecionada,
                responder: _responder)
            : Resultado(_nota_total, _reiniciar_perguntas),
      ),
    );
  }
}
