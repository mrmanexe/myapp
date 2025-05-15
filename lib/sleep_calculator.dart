import 'package:flutter/material.dart';

class SleepCalculator extends StatefulWidget {
  const SleepCalculator({super.key});

  @override
  State<SleepCalculator> createState() => _SleepCalculatorState();
}

class _SleepCalculatorState extends State<SleepCalculator> {
  TimeOfDay? bedTime;
  TimeOfDay? wakeTime;

  String sleepDuration = '0 hours 0 minutes';
  String sleepComment = '';

  // Function to calculate sleep duration and provide a comment
  void calculateSleepDuration() {
    if (bedTime != null && wakeTime != null) {
      final DateTime now = DateTime.now();

      DateTime bedDateTime = DateTime(
          now.year, now.month, now.day, bedTime!.hour, bedTime!.minute);
      DateTime wakeDateTime = DateTime(
          now.year, now.month, now.day, wakeTime!.hour, wakeTime!.minute);

      if (wakeDateTime.isBefore(bedDateTime)) {
        wakeDateTime = wakeDateTime.add(const Duration(days: 1));
      }

      Duration difference = wakeDateTime.difference(bedDateTime);
      sleepDuration = '${difference.inHours} hours ${difference.inMinutes % 60} minutes';

      setState(() {
        
        if (difference.inHours < 5) {
          sleepComment = 'Too short, get more sleep';
        } else if (difference.inHours < 7) {
          sleepComment = 'Decent, but aim for 7-9 hours';
        } else if (difference.inHours >= 7 && difference.inHours <= 9) {
          sleepComment = 'Healthy amount of sleep, make sure you are consistent';
        } else {
          sleepComment = 'Too long, get less sleep';
        }
      });
    }
  }

Future<void> _selectTime(BuildContext context, bool isBedTime) async {
  final TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: isBedTime ? (bedTime ?? TimeOfDay.now()) : (wakeTime ?? TimeOfDay.now()),
    builder: (BuildContext context, Widget? child) {
  return Theme(
    data: ThemeData.dark().copyWith(
      timePickerTheme: TimePickerThemeData(
        backgroundColor: Color.fromARGB(255, 96, 102, 158),
        hourMinuteTextColor: Colors.white,
        dialHandColor: Color.fromARGB(255, 124, 76, 136),
        dialBackgroundColor: Color.fromARGB(255, 196, 171, 210),
        entryModeIconColor: Colors.white,
        dayPeriodTextColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.black; // Selected: white text
          }
          return Colors.white; // Unselected: black text
        }),
        dayPeriodColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return Colors.white; // Selected: black background
          }
          return Color.fromARGB(255, 124, 76, 136); // Unselected: white background
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: Colors.white,
        ),
      ),
      colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 124, 76, 136),
        onPrimary: Colors.white,
        surface: Colors.grey,
        onSurface: Colors.white,
      ),
    ),
    child: child!,
  );
}
,
  );

  if (picked != null) {
    setState(() {
      if (isBedTime) {
        bedTime = picked;
      } else {
        wakeTime = picked;
      }
      calculateSleepDuration(); // Assuming you have this method
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 171, 210),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 102, 158),
        iconTheme: const IconThemeData(
        color: Colors.white, // Set back arrow color to white
      ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Bed Time: ',
                style: TextStyle(color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 96, 102, 158), // Dark grey background
                      foregroundColor: Colors.white, // White text
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    onPressed: () => _selectTime(context, true),
                    child: Text(
                        bedTime != null
                            ? bedTime!.format(context)
                            : 'Select Time',
                            style: const TextStyle(color: Colors.white)
                    ),
                  ),
                ),
              ],
            ),
             const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Wake Time: ',
                style: TextStyle(color: Colors.white),),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 96, 102, 158), // Dark grey background
                      foregroundColor: Colors.white, // White text
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Rounded corners
                      ),
                    ),
                    onPressed: () => _selectTime(context, false),
                    child: Text(wakeTime != null ? wakeTime!.format(context) : 'Select Time'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Sleep Duration: $sleepDuration',
              style: const TextStyle(fontSize: 24,color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              sleepComment,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}