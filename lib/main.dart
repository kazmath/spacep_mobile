// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:mobile_spacep/pages/ajuda.dart';
import 'package:mobile_spacep/pages/calendario.dart';
import 'package:mobile_spacep/pages/erro.dart';
import 'package:mobile_spacep/pages/imagem.dart';
import 'package:mobile_spacep/pages/imagem_full.dart';
import 'package:mobile_spacep/pages/tela_inicial.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: TelaInicial(),
      ),
    );
  }
}


