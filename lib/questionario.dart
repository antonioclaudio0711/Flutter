import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

class Questionario extends StatelessWidget {
  final List? perguntas;
  var pergunta_selecionada;
  final void Function(int) responder;

  Questionario({
    required this.perguntas,
    required this.pergunta_selecionada,
    required this.responder,
  });

  bool get sim_pergunta_selecionada {
    return pergunta_selecionada < perguntas!.length;
  }

  @override
  Widget build(BuildContext context) {
    List respostas = sim_pergunta_selecionada
        ? perguntas![pergunta_selecionada]["respostas"]
        : [];

    return Column(
      children: <Widget>[
        Questao(perguntas![pergunta_selecionada]["texto"]),
        ...respostas.map((resposta) {
          return Resposta(
            resposta["texto"].toString(),
            () => responder(int.parse(resposta["nota"].toString())),
          );
        }).toList(),
      ],
    );
  }
}
