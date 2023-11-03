import 'package:flutter/material.dart';
import 'package:mobile_spacep/pages/calendario.dart';

class TelaInicial extends StatefulWidget {
  TelaInicial({super.key});

  @override
  State<TelaInicial> createState() => _TelaInicialState();
}

class _TelaInicialState extends State<TelaInicial> {
  late TextEditingController apiFormController;

  @override
  void initState() {
    super.initState();
    apiFormController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
              "https://media.discordapp.net/attachments/444606048373047307/1168270986471293039/image.png",
            ),
            fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(51.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Image(
                image: NetworkImage(
                    "https://media.discordapp.net/attachments/444606048373047307/1168271090196426922/image.png"),
              ),
            ),
            TextFormField(
              controller: apiFormController,
              style: TextStyle(color: Colors.grey, fontSize: 23),
              scrollPadding: EdgeInsets.all(20),
              decoration: InputDecoration(
                labelText: "CHAVE API",
                labelStyle: TextStyle(color: Colors.grey, fontSize: 23),
                filled: true,
                fillColor: Color.fromARGB(38, 255, 255, 255),
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 1.0,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 255, 255, 255),
                    width: 1.0,
                  ),
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CalendarioSpaceP();
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.arrow_forward,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 35,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  "precisa de ",
                  style: TextStyle(color: Color(0xFF3A6D8E), fontSize: 20),
                ),
                Text(
                  "ajuda?",
                  style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}