import 'package:flutter/material.dart';

class SurveyScreen extends StatefulWidget {
  const SurveyScreen({super.key});

  @override
  State<SurveyScreen> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  final List<Map<String, dynamic>> _questions = [
    {
      'question': '1. What time do you usually go to sleep?',
      'options': [
        'Before 10 pm',
        'Between 10 pm - 12 am',
        'After 12 am',  
        'It varies every day'
      ],
    },
    {
      'question': '2. What time do you usually wake up?',
      'options': [
        'Before 6 am',
        'Between 6 am - 8 am',
        'After 8 am',
        'It varies every day'
      ],
    },
    {
      'question': '3. How many hours of sleep do you usually get?',
      'options': ['8-9 hours', '6-7 hours', '4-5 hours', 'Less than 4 hours'],
    },
    {
      'question': '4. Do you follow the same sleep schedule daily?',
      'options': [
        'Yes, I’m consistent',
        'Most days',
        'Rarely',
        'No, it varies'
      ],
    },
    {
      'question':
          '5. When do you usually consume caffeine?',
      'options': ['Morning', 'Afternoon', 'Evening','I do not drink caffine'],
    },
    {
      'question':
          '6. What activities do you do before bed?',
      'options': ['Read or meditate', 'Watch TV', 'Use phone or tablet', 'None of these'],
    },
    {
      'question': '7. How active are you during the day?',
      'options': [
        'Very active',
        'Moderately active',
        'Not very active',
        'Sedentary'
      ],
    },
    {
      'question': '8. Do you experience stress before bed?',
      'options': ['No, I stay relaxed', 'Occasionally', 'Frequently', 'Always'],
    },
    {
      'question': '9. Do you take naps during the day?',
      'options': ['No, never', 'Occasionally', 'Frequently', 'Every day'],
    },
    {
      'question': '10. How comfortable is your sleep environment?',
      'options': [
        'Very comfortable',
        'Moderately comfortable',
        'Somewhat uncomfortable',
        'Uncomfortable'
      ],
    },
  ];

   // Gives advice based on answers
  final Map<String, String> _advice = {
    // Bedtime Advice
    'Before 10 pm':
        "You likely have a great sleep routine. Going to bed early is great for health. Keep it up!",
    'Between 10 pm - 12 am':
        "A reasonable bedtime. Make sure you're getting enough rest and maintaining consistency.",
    'After 12 am':
        "This may disrupt your sleep cycle. Consider going to bed earlier for better sleep quality.",
    'It varies every day':
        "A fluctuating sleep schedule can affect sleep quality. Try setting a more consistent bedtime.",


    // Wake-up Time Advice
    'Before 6 am':
        "Waking up early can set a positive tone for your day, but ensure you're getting enough sleep.",
    'Between 6 am - 8 am':
        "A healthy wake-up time. Ensure it matches your bedtime for sufficient rest.",
    'After 8 am':
        "If you’re regularly waking up this late, consider adjusting your bedtime to ensure enough sleep.",
    'At random times':
        "Try to wake up at the same time every day for better sleep health.",


    // Sleep Duration Advice
    '8-9 hours':
        "Perfect! This is the ideal amount of sleep for good health and well-being.",
    '6-7 hours':
        "May be enough for some, but consider adding more sleep if you feel fatigued.",
    '4-5 hours':
        "Insufficient sleep. Try to aim for at least 7-8 hours for better health.",
    'Less than 4 hours':
        "Very little sleep can lead to serious health issues. Prioritize more sleep for better well-being.",


    // Sleep Consistency Advice
    'Yes, I’m consistent':
        "Great! Consistency is key for regulating your sleep cycle and improving sleep quality.",
    'Most days': "Keep it up, but try to be more consistent for better rest.",
    'Rarely':
        "Fluctuating sleep schedules can disrupt your rhythm. Aim for a more regular routine.",
    'No, it varies':
        "A variable sleep schedule affects your circadian rhythm. Try setting a consistent routine.",


    // Caffeine Timing Advice
    'Morning':
        "Great! Morning caffeine is ideal and unlikely to interfere with sleep.",
    'Afternoon':
        "Can still affect your sleep, especially if you're sensitive to caffeine. Limit intake later in the day.",
    'Evening':
        "Avoid caffeine in the evening, as it may interfere with your sleep quality.",
    'I do not drink caffine':
        "Great! It's impossible for caffeine to interfere with your sleep!",


    // Pre-bed Activities Advice
    'Read or meditate':
        "Excellent! These activities are perfect for relaxing before bed and improving sleep quality.",
    'Watch TV':
        "While relaxing, too much screen time before bed can negatively affect sleep. Consider reducing screen exposure before sleeping.",
    'Use phone or tablet':
        "The blue light from screens can disrupt your sleep. Limit screen use before bed or use blue light filters.",
    'None of these':
        "While you aren't being negatively impacted, you also aren't being positively impacted. Add activities like reading or meditating to improve your sleep.",


    // Activity Level Advice
    'Very active':
        "Great! Regular physical activity improves sleep quality. Keep it up.",
    'Moderately active':
        "Still beneficial, but adding more physical activity could improve sleep further.",
    'Not very active':
        "Increase activity to help regulate your sleep cycle. Even light exercise can make a difference.",
    'Sedentary':
        "Lack of activity may impact your sleep. Aim to move more during the day, such as walking or stretching.",


    // Stress Levels Advice
    'No, I stay relaxed':
        "Fantastic! Staying relaxed promotes better sleep. Keep up your calming bedtime routine.",
    'Occasionally':
        "Occasional stress is normal, but consider adding relaxation techniques like deep breathing to ease stress.",
    'Frequently':
        "High stress can disrupt sleep. Incorporating mindfulness practices could help you manage stress before bed.",
    'Always':
        "Chronic stress affects sleep. Try relaxation techniques, journaling, or seeking professional help to manage stress.",


    // Napping Advice
    'No, never':
        "If you're getting enough sleep at night, skipping naps is fine. If you're tired, short naps can help.",
    'Sometimes':
        "Naps are fine, but avoid taking them too late in the day, as they can interfere with nighttime sleep.",
    'Usually':
        "Frequent naps may mean you're not getting enough sleep at night. Try adjusting your nighttime routine.",
    'Every day':
        "Daily naps can interfere with nighttime sleep. Consider limiting naps or adjusting your nighttime schedule.",


    // Sleep Environment Comfort Advice
    'Very comfortable':
        "Excellent! A comfortable environment promotes good sleep. Keep your room cool, dark, and quiet.",
    'Moderately comfortable':
        "Consider making small improvements like a better mattress or blackout curtains for better comfort.",
    'Somewhat uncomfortable':
        "Work on creating a more comfortable environment with better bedding or noise reduction for better rest.",
    'Uncomfortable':
        "An uncomfortable sleep environment can severely affect sleep quality. Try to adjust the room temperature, lighting, and bedding.",
  };



  int _currentQuestionIndex = 0;
  final Map<int, String> _answers = {};


  void _nextQuestion(String answer) {
    setState(() {
      _answers[_currentQuestionIndex] = answer;
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
      } else {
        _showResults();
      }
    });
  }


  void _showResults() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900], // Dark background for popup
        title: const Text(
          'Survey Results',
          style: TextStyle(color: Colors.white),
        ),
        content: SizedBox(
          height: 300, // Set a fixed height or use constraints depending on your layout
            child: SingleChildScrollView(
              child: ListBody( // Makes the ListView take only as much space as needed (if inside another scrollable)
              children: _answers.entries.map((entry) {
                final question = _questions[entry.key]['question'];
                final answer = entry.value;
                final advice = _advice[answer];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    '$question: $answer\nAdvice: $advice',
                    style: const TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.left,
                  ),
                );
              }).toList(),
            ),
          ),
        ),


        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              _restartSurvey();
            },
            child: const Text('Restart', style: TextStyle(color: Color.fromARGB(255, 201, 201, 201))),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop(); // Return to the home page
            },
            child: const Text('Home', style: TextStyle(color: Color.fromARGB(255, 201, 201, 201))),
          ),
        ],
      ),
    );
  }


  void _restartSurvey() {
    setState(() {
      _currentQuestionIndex = 0;
      _answers.clear();
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentQuestion = _questions[_currentQuestionIndex];
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 196, 171, 210),
      appBar: AppBar(
        title: const Text('Survey Page', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 96, 102, 158),
        iconTheme: const IconThemeData(
        color: Colors.white, // Set back arrow color to white
      )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion['question'],
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            ...currentQuestion['options'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 96, 102, 158), // Dark button
                    foregroundColor: Colors.white, // White text
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () => _nextQuestion(option),
                  child: Text(option),
                ),
              );
            }).toList(),
          ],
        ),
      ),
    );
  }
}