// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: TelaInicial(),
      ),
    );
  }
}

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
            Stack(
              alignment: Alignment.centerRight,
              children: [
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
                  ),
                ),
                GestureDetector(
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
                )
              ],
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

class CalendarioSpaceP extends StatefulWidget {
  const CalendarioSpaceP({super.key});

  @override
  State<CalendarioSpaceP> createState() => _CalendarioSpacePState();
}

class _CalendarioSpacePState extends State<CalendarioSpaceP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              "https://media.discordapp.net/attachments/444606048373047307/1168270986471293039/image.png",
            ),
            fit: BoxFit.cover,
          ),
        ),
        // constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.logout,
                      color: Colors.white,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Color.fromARGB(127, 217, 217, 217)),
                      shape: MaterialStatePropertyAll(CircleBorder())
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23, bottom: 43, right: 23),
                child: TableCalendar(
                  calendarStyle: CalendarStyle(
                      tablePadding: EdgeInsets.only(top: 23.0),
                      rowDecoration: BoxDecoration(color: Colors.red)),
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  firstDay: DateTime.now().subtract(Duration(days: 360)),
                  lastDay: DateTime.now().add(Duration(days: 360)),
                  focusedDay: DateTime.now(),
                  shouldFillViewport: true,
                  availableCalendarFormats: {CalendarFormat.month: 'Month'},
                  headerStyle: HeaderStyle(
                    titleTextStyle: TextStyle(
                      color: Color(0xFFFEFEFE),
                      fontSize: 30,
                    ),
                    leftChevronVisible: false,
                    rightChevronVisible: false,
                    titleCentered: true,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    // return Container(
    //   decoration: BoxDecoration(
    //     image: DecorationImage(
    //       image: NetworkImage(
    //         "https://media.discordapp.net/attachments/444606048373047307/1168270986471293039/image.png",
    //       ),
    //       fit: BoxFit.cover,
    //     ),
    //   ),
    //   constraints: BoxConstraints.expand(),
    //   child: TableCalendar(
    //     calendarStyle: CalendarStyle(

    //     ),
    //     firstDay: DateTime.utc(2023, 10, 16),
    //     lastDay: DateTime.utc(2023, 10, 31),
    //     focusedDay: DateTime.now(),
    //   ),
    // );
  }
}
