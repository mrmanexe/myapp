//testing

import 'package:flutter/material.dart';
import 'home_page.dart'; // Ensure this points to the home screen file
import 'count_sheep.dart';
import 'sleep_calculator.dart';
import 'dump_pad.dart';
import 'relaxation_guide.dart';
import 'survey_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sleep Wellness',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 196, 171, 210),
      ),
      home: const HomePage(), // The screen we just created
      routes: {
        '/sheep': (context) => const SleepGameWidget(),
        '/calculator': (context) => const SleepCalculator(),
        '/dump': (context) => const DumpPad(),
        '/relax': (context) => const RelaxationGuide(),
        '/survey': (context) => const SurveyScreen(),
      },
    );
  }
  
}
