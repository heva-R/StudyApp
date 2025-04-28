import 'package:flutter/material.dart';

import 'BottomNavBar.dart';
import 'DashboardScreen.dart';
import 'LetsStart.dart';
import 'TimelineScreen.dart';
import 'noteScreen.dart';

void main() {
  runApp(const StudyApp());
}

class StudyApp extends StatelessWidget {
  const StudyApp({super.key});

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Study App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LetsStart(),
        '/dashboard': (context) => const DashboardScreen(),
        '/timeline': (context) => const TimelineScreen(),
        '/NoteScreen': (context) => const NoteScreen(),
      },
    );
  }
}
