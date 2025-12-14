import 'package:flutter/material.dart';
import 'wizard_state.dart';
import 'results_screen.dart';

// --- BASE SCREEN ---
class BaseStepScreen extends StatelessWidget {
  final String title;
  final String question;
  final List<Widget> options;

  const BaseStepScreen({
    super.key, 
    required this.title, 
    required this.question, 
    required this.options
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(question, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 30),
            Expanded(
              child: ListView(children: options),
            ),
          ],
        ),
      ),
    );
  }
}

// --- STEP 1: Building Type ---
class Step1Building extends StatelessWidget {
  final WizardState state;
  const Step1Building({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BaseStepScreen(
      title: "Step 1 of 5",
      question: "Select Building Type",
      options: [
        _OptionCard(label: "Office", icon: Icons.business, onTap: () => _next(context, "Office")),
        _OptionCard(label: "Residential", icon: Icons.home, onTap: () => _next(context, "Residential")),
        _OptionCard(label: "Commercial", icon: Icons.store, onTap: () => _next(context, "Commercial")),
        _OptionCard(label: "Industrial", icon: Icons.factory, onTap: () => _next(context, "Industrial")),
      ],
    );
  }

  void _next(BuildContext context, String val) {
    state.buildingType = val;
    Navigator.push(context, MaterialPageRoute(builder: (_) => Step2Region(state: state)));
  }
}

// --- STEP 2: Region ---
class Step2Region extends StatelessWidget {
  final WizardState state;
  const Step2Region({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BaseStepScreen(
      title: "Step 2 of 5",
      question: "Select Climate Region",
      options: [
        _OptionCard(label: "Hot", icon: Icons.wb_sunny, onTap: () => _next(context, "Hot")),
        _OptionCard(label: "Hot-Dry", icon: Icons.landscape, onTap: () => _next(context, "Hot-Dry")),
        _OptionCard(label: "Cold", icon: Icons.ac_unit, onTap: () => _next(context, "Cold")),
        _OptionCard(label: "Moderate", icon: Icons.thermostat, onTap: () => _next(context, "Moderate")),
        _OptionCard(label: "Mediterranean", icon: Icons.wb_twilight, onTap: () => _next(context, "Mediterranean")),
      ],
    );
  }

  void _next(BuildContext context, String val) {
    state.region = val;
    Navigator.push(context, MaterialPageRoute(builder: (_) => Step3Material(state: state)));
  }
}

// --- STEP 3: Material ---
class Step3Material extends StatelessWidget {
  final WizardState state;
  const Step3Material({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BaseStepScreen(
      title: "Step 3 of 5",
      question: "Select Wall Material",
      options: [
        _OptionCard(label: "Concrete", icon: Icons.foundation, onTap: () => _next(context, "Concrete")),
        _OptionCard(label: "Brick", icon: Icons.grid_view, onTap: () => _next(context, "Brick")),
        _OptionCard(label: "Wood", icon: Icons.park, onTap: () => _next(context, "Wood")),
        _OptionCard(label: "Insulation", icon: Icons.layers, onTap: () => _next(context, "Insulation")),
        _OptionCard(label: "Geopolymer", icon: Icons.science, onTap: () => _next(context, "Geopolymer")),
      ],
    );
  }

  void _next(BuildContext context, String val) {
    state.material = val;
    Navigator.push(context, MaterialPageRoute(builder: (_) => Step4Priority(state: state)));
  }
}

// --- STEP 4: Priority ---
class Step4Priority extends StatelessWidget {
  final WizardState state;
  const Step4Priority({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BaseStepScreen(
      title: "Step 4 of 5",
      question: "Select Priority Aspect",
      options: [
        _OptionCard(label: "Economical", icon: Icons.attach_money, onTap: () => _next(context, "Economical")),
        _OptionCard(label: "Technical", icon: Icons.settings, onTap: () => _next(context, "Technical")),
        _OptionCard(label: "Kinetic", icon: Icons.speed, onTap: () => _next(context, "Kinetic")),
        _OptionCard(label: "Chemical", icon: Icons.science, onTap: () => _next(context, "Chemical")),
        _OptionCard(label: "Thermodynamic", icon: Icons.fire_extinguisher, onTap: () => _next(context, "Thermodynamic")),
      ],
    );
  }

  void _next(BuildContext context, String val) {
    state.priority = val;
    Navigator.push(context, MaterialPageRoute(builder: (_) => Step5System(state: state)));
  }
}

// --- STEP 5: System ---
class Step5System extends StatelessWidget {
  final WizardState state;
  const Step5System({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return BaseStepScreen(
      title: "Step 5 of 5",
      question: "Cooling/Heating System",
      options: [
        _OptionCard(label: "Mechanical Cooling", icon: Icons.ac_unit, onTap: () => _finish(context, "Mechanical Cooling")),
        _OptionCard(label: "Mechanical Heating", icon: Icons.local_fire_department, onTap: () => _finish(context, "Mechanical Heating")),
        _OptionCard(label: "Free-Running", icon: Icons.air, onTap: () => _finish(context, "Free-Running")),
        _OptionCard(label: "None/Passive", icon: Icons.nature, onTap: () => _finish(context, "")), // Empty string if none
      ],
    );
  }

  void _finish(BuildContext context, String val) {
    state.system = val;
    Navigator.push(context, MaterialPageRoute(builder: (_) => ResultsScreen(state: state)));
  }
}

// --- Helper UI ---
class _OptionCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _OptionCard({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))]
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.green, size: 28),
              const SizedBox(width: 20),
              Text(label, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}