import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

void main() {
  runApp(const CountSheep());
}

class CountSheep extends StatelessWidget {
  const CountSheep({super.key});

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Counting Sheep',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromARGB(255, 0, 0, 0),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 0, 0)),
      ),
    );
  }
}

class SleepGameWidget extends StatefulWidget {
  const SleepGameWidget({super.key});

  @override
  State<SleepGameWidget> createState() => _SleepGameWidgetState();
}

class _SleepGameWidgetState extends State<SleepGameWidget> with SingleTickerProviderStateMixin {
  int sheepCount = 0;
  final List<Widget> sheepList = [];
  late AnimationController _controller;
  late Animation<double> _animation;
  final Random random = Random();
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    // Define curve for the jump animation
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    // Start the periodic sheep adding timer
    _timer = Timer.periodic(const Duration(seconds: 4), _addSheep);
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel(); // Cancel the timer when widget is disposed
    super.dispose();
  }

  void _addSheep(Timer timer) {
    setState(() {
      sheepCount++;
    });
    // Start animation for the sheep
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      appBar: AppBar(
      backgroundColor: Colors.black,
      title: const Text(
        'Count Sheep',
        style: TextStyle(color: Colors.white),
      ),
      iconTheme: const IconThemeData(
        color: Colors.white, // Set back arrow color to white
      ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Expanded(
              child: Stack(
                children: [
                  // Fence
                  Positioned(
                    bottom: 100,
                    left: screenWidth / 2 - 25,
                    child: Container(
                      width: 20,
                      height: 77,
                      color: Colors.brown,
                    ),
                  ),
                  //Ground
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: const Color.fromARGB(255, 24, 48, 26),
                      height: 100,
                    ),
                  ),

                  // Animated Sheep
                  AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      // Define trajectory (parabola-like movement)
                      double xPos = _animation.value * screenWidth * 1.2;
                      double yPos = 77 * sin(pi * _animation.value);// Hop effect
                      return Positioned(
                        bottom: 100 + yPos,
                        left: xPos - 70, // Offset to center sheep icon
                        child: const Icon(
                            Icons.cloud,
                            color: Colors.white, 
                            size: 67
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}