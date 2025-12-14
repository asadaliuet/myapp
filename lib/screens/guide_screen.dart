import 'package:flutter/material.dart';
import 'wizard/step_screens.dart'; // Import the new Wizard screens
import 'wizard/wizard_state.dart'; // Import the state

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
            "How to use the Wizard",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          const Text(
            "Our AI-powered tool scans 60 validated rules to find the best Phase Change Material (PCM) for your project. Follow these 5 steps:",
            style: TextStyle(color: Colors.grey, height: 1.5),
          ),
          const SizedBox(height: 30),
          
          _buildStep(1, "Building Type", "Select whether your project is Residential, Commercial, Office, or Industrial."),
          _buildStep(2, "Climate Zone", "Choose the region's climate (e.g., Hot, Cold, Mediterranean)."),
          _buildStep(3, "Wall Material", "Specify the primary construction material (Concrete, Brick, Wood, etc.)."),
          _buildStep(4, "Priority", "What matters most? (Economical, Technical Performance, Chemical Stability, etc.)"),
          _buildStep(5, "HVAC System", "Indicate if the building uses Mechanical Cooling, Heating, or Passive Ventilation."),

          const Divider(height: 40),

          const Text(
            "Understanding Results",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          _buildInfoItem(Icons.star, "Best Match", "The algorithm ranks recommendations based on how many of your inputs match the rule database."),
          _buildInfoItem(Icons.layers, "Positioning", "We tell you exactly where to place the PCM (e.g., 'Behind outer surface') for maximum efficiency."),
          _buildInfoItem(Icons.book, "References", "Every recommendation is backed by academic research (e.g., Zhang et al., 2018)."),

          const SizedBox(height: 30),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton.icon(
              onPressed: () {
                // Navigate to the new Wizard
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(builder: (_) => Step1Building(state: WizardState()))
                );
              },
              icon: const Icon(Icons.rocket_launch),
              label: const Text("Start Selection Wizard", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green[700],
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
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
            radius: 14,
            backgroundColor: Colors.green[100],
            child: Text("$num", style: TextStyle(color: Colors.green[800], fontWeight: FontWeight.bold, fontSize: 14)),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                const SizedBox(height: 4),
                Text(desc, style: TextStyle(color: Colors.grey[700], fontSize: 13)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildInfoItem(IconData icon, String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.blueGrey),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black87, fontSize: 13, height: 1.4),
                children: [
                  TextSpan(text: "$title: ", style: const TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: desc),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}