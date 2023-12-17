import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TUD Mobile'),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildClickableButton(context, 'Mein Kalender', '/calendar'),
            buildClickableButton(context, 'Mein Studium', '/mein-studium'),
            buildClickableButton(context, 'Neuigkeiten', '/news'),
            buildClickableButton(
                context, 'Campus Navigator', '/campus-navigator'),
          ],
        ),
      ),
    );
  }

  Widget buildClickableButton(BuildContext context, String text, String route) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: SizedBox(
        width: 780,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, route);
          },
          style: ElevatedButton.styleFrom(
            primary: const Color(0xFF002557), // Change button background color
            onPrimary: Colors.white, // Change button text color
            padding: const EdgeInsets.all(10), // Padding inside the button
            textStyle: const TextStyle(fontSize: 21), // Text size
          ),
          child: Text(text),
        ),
      ),
    );
  }
}
