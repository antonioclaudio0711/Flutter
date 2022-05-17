import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int nota;
  final void Function() reinicio;

  Resultado(this.nota, this.reinicio);

  String get frase_resultado {
    if (nota < 8) {
      return "Parabéns!";
    } else if (nota < 12) {
      return "Você é bom!";
    } else if (nota < 16) {
      return "Impressionante!";
    } else {
      return "Perfeito!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            frase_resultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: reinicio,
          child: const Text(
            "Reiniciar!",
            style: TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
