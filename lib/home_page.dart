import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 196, 171, 210),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 96, 102, 158),
        title: const Text('Welcome', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const Text(
              'Sleep Well 💤',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Let’s improve your sleep together.',
              style: TextStyle(fontSize: 18, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(
                children: [
                  /*
                  _buildFeatureTile(context, 'Count Sheep', 'assets/images/sheep icon.png', Colors.white, () {
                    Navigator.pushNamed(context, '/sheep');
                  }),
                  */
                  _buildFeatureTile(context, 'Sleep Calculator', 'assets/images/sleep calculator.png', Colors.white, () {
                    Navigator.pushNamed(context, '/calculator');
                  }),
                  _buildFeatureTile(context, 'Dump Pad', 'assets/images/dump pad.png', Colors.white, () {
                    Navigator.pushNamed(context, '/dump');
                  }),
                  _buildFeatureTile(context,'Relaxation Guide', 'assets/images/breathing icon.png', Colors.white, () {
                    Navigator.pushNamed(context, '/relax');
                  }),
                  _buildFeatureTile(context, 'Sleep Survey', 'assets/images/clipboard icon.png', Colors.white, () {
                    Navigator.pushNamed(context, '/survey');
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeatureTile(BuildContext context, String label, String imagePath, Color textColor, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 96, 102, 158),
          foregroundColor: textColor,
          minimumSize: const Size(double.infinity, 60),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              width: 30,
              height: 30,
            ),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
