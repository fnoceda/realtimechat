import 'package:flutter/material.dart';

class Lables extends StatelessWidget {
  final String ruta;
  final String titulo;
  final String subTitulo;
  const Lables(
      {Key? key,
      required this.ruta,
      required this.titulo,
      required this.subTitulo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          titulo,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, ruta);
          },
          child: Text(
            subTitulo,
            style: TextStyle(
              color: Colors.blue[600],
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
