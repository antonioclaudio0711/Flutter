import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resposta extends StatelessWidget {
  final String texto;
  final void Function() selecionar;

  Resposta(this.texto, this.selecionar);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: Colors.blue),
        child: Text(texto, style: const TextStyle(color: Colors.white)),
        onPressed: selecionar,
      ),
    );
  }
}
