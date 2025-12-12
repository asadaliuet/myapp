import 'package:flutter/material.dart';
import 'home_screen.dart';

class GuideScreen extends StatelessWidget {
  const GuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Start Guide'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const Text(
            "How to use this App",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          
          _buildStep(1, "Select Mode", "Choose between 'Material Selection' to find the best PCM, or 'Positioning' to find where to put it in the wall."),
          _buildStep(2, "Input Data", "Fill in the dropdowns (Climate, Building Type, Priority). The more accurate the data, the better the recommendation."),
          _buildStep(3, "Get Results", "Tap the calculation button. The app will provide a specific PCM type or wall position with a confidence level."),
          _buildStep(4, "Analyze", "Read the justification to understand why that specific material was chosen based on thermal physics rules."),

          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (_) => const PCMSelectionHome())
              );
            },
            icon: const Icon(Icons.play_arrow),
            label: const Text("Go to Selection Tool"),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green[700],
              foregroundColor: Colors.white,
              padding: const EdgeInsets.all(16),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStep(int num, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: Colors.green[100],
            child: Text("$num", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: const TextStyle(color: Colors.grey)),
              ],
            ),
          )
        ],
      ),
    );
  }
}