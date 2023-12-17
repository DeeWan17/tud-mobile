import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  late DateTime monday;
  late DateTime sunday;

  @override
  void initState() {
    super.initState();
    // Initialize 'monday' and 'sunday'
    monday = DateTime.utc(2023, 12, 18);
    sunday = DateTime.utc(2023, 12, 24);
  }

  void setNextWeekdays() {
    setState(() {
      monday = monday.add(const Duration(days: 7));
      sunday = sunday.add(const Duration(days: 7));
    });
  }

  void setPreviousWeekdays() {
    setState(() {
      monday = monday.subtract(const Duration(days: 7));
      sunday = sunday.subtract(const Duration(days: 7));
    });
  }

  String formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}.${date.month.toString().padLeft(2, '0')}';
  }

  Widget buildCalendarNavigation() {
    return Container(
      padding: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              setPreviousWeekdays();
            },
          ),
          Text(
            '${formatDate(monday)} - ${formatDate(sunday)}',
            style: const TextStyle(fontSize: 18),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              setNextWeekdays();
            },
          ),
        ],
      ),
    );
  }

  final List<String> hardcodedEvents = [
    'DiS (V)',
    'DiS (Ü)',
    'EMI (V)',
    'EMI (Ü)',
    'AuD (V)',
    'AuD (Ü)',
    'LA (V)',
    'LA (Ü)',
    'Englisch',
    '', // Add more empty strings for additional slots
  ];

  List<Widget> buildDayEvents(List<String> events) {
    List<Widget> dayEvents = [];
    for (String eventName in events) {
      Color? eventColor =
          eventName.isNotEmpty ? Colors.blue[100] : Colors.transparent;
      dayEvents.add(
        Column(
          children: [
            const SizedBox(height: 8),
            SizedBox(
              height: 80,
              child: Center(
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: eventColor,
                    borderRadius: BorderRadius.circular(
                        7.0), // Adjust the radius as needed
                  ),
                  child: eventName.isNotEmpty
                      ? Center(
                          child: Text(
                            eventName,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 15,
                              fontFamily: 'Roboto',
                            ),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            const Divider(
              color: Colors.grey,
            ),
          ],
        ),
      );
    }
    return dayEvents;
  }

  Widget buildDayColumn(String day, List<String> events) {
    return Container(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        children: [
          Text(day),
          ...buildDayEvents(events),
        ],
      ),
    );
  }

  Widget buildCalendar() {
    List<String> eventsForMon = [
      hardcodedEvents[2],
      '',
      '',
      hardcodedEvents[0],
      '',
      '',
    ];
    List<String> eventsForTue = [
      '',
      hardcodedEvents[1],
      '',
      '',
      hardcodedEvents[0],
      '',
    ];
    List<String> eventsForWed = [
      hardcodedEvents[4],
      '',
      hardcodedEvents[5],
      '',
      '',
      '',
    ];
    List<String> eventsForThu = [
      '',
      '',
      hardcodedEvents[6],
      hardcodedEvents[7],
      '',
      '',
    ];
    List<String> eventsForFri = [
      '',
      hardcodedEvents[2],
      hardcodedEvents[3],
      '',
      '',
      '',
    ];
    List<String> eventsForSat = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];
    List<String> eventsForSun = [
      '',
      '',
      '',
      '',
      '',
      '',
    ];

    return Table(
      border: TableBorder.all(color: Colors.grey),
      children: [
        TableRow(
          children: [
            buildDayColumn('Mon', eventsForMon),
            buildDayColumn('Tue', eventsForTue),
            buildDayColumn('Wed', eventsForWed),
            buildDayColumn('Thu', eventsForThu),
            buildDayColumn('Fri', eventsForFri),
            buildDayColumn('Sat', eventsForSat),
            buildDayColumn('Sun', eventsForSun),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mein Kalender'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Hier sollte die Logik für den Zugriff auf das Nutzerprofil stehen
            },
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildCalendarNavigation(),
              const SizedBox(height: 0),
              buildCalendar(),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 16.0, right: 8.0),
        child: FloatingActionButton(
          onPressed: () {
            // Add your logic here for the "+" button action
            // For example: Navigate to a new screen, add an event, etc.
          },
          child: const Icon(Icons.add),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
