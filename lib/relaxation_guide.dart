import 'package:flutter/material.dart';
import 'dart:async';

class RelaxationGuide extends StatefulWidget {
  const RelaxationGuide({super.key});

  @override
  State<RelaxationGuide> createState() => _RelaxationGuideState();
}

class _RelaxationGuideState extends State<RelaxationGuide>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  Timer? _timer;
  int _step = 0; // 0 = Inhale, 1 = Hold, 2 = Exhale, 3 = Hold
  bool _isReady = true;

  final List<String> _instructions = [
    'Inhale deeply...',
    'Hold your breath...',
    'Exhale slowly...',
    'Hold your breath...'
  ];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _controller.value = 0.0;
    _animation = Tween<double>(begin: 1.0, end: 1.5).animate(_controller);

    // Delay showing instructions + starting animation
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _isReady = false;
        _step = 0; // Make sure we start on "Inhale"
      });

      _controller.forward(); // Start inhale animation
      _startBreathingGuide();
    });
  }

  void _startBreathingGuide() {
    _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
      setState(() {
        _step = (_step + 1) % _instructions.length;
        if (_step == 0) {
          _controller.forward(); // Inhale
        } else if (_step == 1 || _step == 3) {
          _controller.stop(); // Hold
        } else if (_step == 2) {
          _controller.reverse(); // Exhale
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 171, 210),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 96, 102, 158),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Follow the breathing guide:',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            const SizedBox(height: 20),

            // Animated Breathing Circle
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _animation.value,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color.fromARGB(255, 96, 102, 158),
                    ),
                  ),
                );
              },
            ),


            const SizedBox(height: 20),

            // Instruction with AnimatedSwitcher
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              transitionBuilder: (child, animation) =>
                  FadeTransition(opacity: animation, child: child),
              child: Text(
                _isReady ? 'Ready?' : _instructions[_step],
                key: ValueKey(_isReady ? 'Ready' : _instructions[_step]),
                style: const TextStyle(fontSize: 28, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
