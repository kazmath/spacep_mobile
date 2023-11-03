// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_spacep/pages/imagem.dart';
import 'package:mobile_spacep/pages/tela_inicial.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
       //body: TelaInicial(),
       body: ImageDesc(),
      ),
    );
  }
}