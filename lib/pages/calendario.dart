import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:mobile_spacep/pages/erro.dart';
import 'package:mobile_spacep/pages/imagem.dart';
import 'package:mobile_spacep/pages/tela_inicial.dart';
import 'package:mobile_spacep/utils.dart';
import 'package:mobile_spacep/services/save.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class CalendarioSpaceP extends StatefulWidget {
  final String APIKEY;

  const CalendarioSpaceP({super.key, required String this.APIKEY});

  @override
  State<CalendarioSpaceP> createState() => _CalendarioSpacePState();
}

class _CalendarioSpacePState extends State<CalendarioSpaceP> {
  late DateTime _focusedDay;

  DateTime? _selectedDay;

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
    save(widget.APIKEY).then((value) async {
      for (var element in jsonDecode(value.body)) {
        prefs.setString(element['date'], jsonEncode(element));
      }
    });
    _focusedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Stack(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 10, left: 10),
                      padding: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(100, 255, 255, 255),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 23, bottom: 43, right: 23),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Image(
                        image: AssetImage("assets/logo.png"),
                        height: 60,
                      ),
                    ),
                    Expanded(
                      child: TableCalendar(
                        calendarStyle: CalendarStyle(
                          tablePadding: EdgeInsets.only(top: 23.0),
                          defaultTextStyle: TextStyle(
                            color: Colors.white,
                          ),
                          weekendTextStyle: TextStyle(
                            color: Color.fromARGB(255, 48, 110, 151),
                          ),
                          outsideTextStyle: TextStyle(
                            color: Color(0xff633737),
                          ),
                          rowDecoration: BoxDecoration(
                            color: Color.fromARGB(25, 255, 255, 255),
                          ),
                          todayDecoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(142, 54, 161, 233),
                          ),
                        ),
                        startingDayOfWeek: StartingDayOfWeek.monday,
                        firstDay: DateTime.now().subtract(Duration(days: 360)),
                        lastDay: DateTime.now().add(Duration(days: 360)),
                        focusedDay: _focusedDay,
                        shouldFillViewport: true,
                        availableCalendarFormats: {
                          CalendarFormat.month: 'Month'
                        },
                        headerStyle: HeaderStyle(
                          titleTextStyle: TextStyle(
                            color: Color(0xFFFEFEFE),
                            fontSize: 30,
                          ),
                          leftChevronVisible: false,
                          rightChevronVisible: false,
                          titleCentered: true,
                        ),
                        onDaySelected: (_, focusedDay) {
                          maybeOpenImage(prefs, context, focusedDay, false);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


