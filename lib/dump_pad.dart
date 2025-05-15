import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DumpPad(),
    );
  }
}

class DumpPad extends StatefulWidget {
  const DumpPad({super.key});

  @override
  State<DumpPad> createState() => _DumpPadState();
}

class _DumpPadState extends State<DumpPad> {
  // Controller for the TextField to manage user input
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller
        .dispose(); // Clean up the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 171, 210),
      appBar: AppBar(
        title: const Text('Dump Pad', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 96, 102, 158),
        iconTheme: const IconThemeData(
          color: Colors.white, // Set back arrow color to white
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // A simple text field for the user to write in
            TextField(
              controller: _controller,
              maxLines: 7,
              style: TextStyle(color: Colors.white), // Text color
              decoration: InputDecoration(
                filled: true,
                fillColor: Color.fromARGB(255, 196, 171, 210), // background
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                  borderSide: BorderSide(
                      color: Color.fromARGB(255, 96, 102, 158)), // Border color
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: Colors.black), // Border color when enabled
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                      color: const Color.fromARGB(
                          255, 0, 0, 0)), // Border color when focused
                ),
                hintText: 'Write down your anxieties...',
                hintStyle: TextStyle(
                    color:
                        Color.fromARGB(255, 196, 171, 210)), // Hint text color
              ),
            ),

            const SizedBox(height: 20),
            // A button to print the content to console (you can modify it as per your needs)
            ElevatedButton(
              onPressed: () {
                _controller.clear();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    Color.fromARGB(255, 27, 27, 27), // Button color
                foregroundColor: Colors.white, // Text color
              ),
              child: const Text('Delete Text'),
            ),
          ],
        ),
      ),
    );
  }
}
