import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarioSpaceP extends StatefulWidget {
  const CalendarioSpaceP({super.key});

  @override
  State<CalendarioSpaceP> createState() => _CalendarioSpacePState();
}

class _CalendarioSpacePState extends State<CalendarioSpaceP> {
  late DateTime _focusedDay;

  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
  }

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
                  GestureDetector(
                    onTap: () {},
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
                  onDaySelected: (_, focusedDay) {
                    print(focusedDay);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}