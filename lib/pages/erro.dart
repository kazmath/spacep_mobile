import 'package:flutter/material.dart';

class DialgErro extends StatelessWidget {
  const DialgErro({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.close, color: Colors.white,),
              
            ),
          ),
          Text(
            "Erro: Selecione uma data que exista no banco de dados",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
      backgroundColor: Color(0xFF4E4E4E),
    );
  }
}
