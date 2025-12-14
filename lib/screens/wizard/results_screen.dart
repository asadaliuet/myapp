import 'package:flutter/material.dart';
import '../../logic/rules_logic.dart';
import '../../models/result_model.dart';
import 'wizard_state.dart';

class ResultsScreen extends StatelessWidget {
  final WizardState state;

  const ResultsScreen({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    final results = RulesLogic.getTopRecommendations(
      buildingType: state.buildingType,
      region: state.region,
      material: state.material,
      priority: state.priority,
      system: state.system,
    );

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text("Recommended PCM"),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
          )
        ],
      ),
      body: results.isEmpty 
          ? _buildNoResults(context)
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: results.length,
              itemBuilder: (context, index) {
                final item = results[index];
                return _buildResultCard(item, index == 0);
              },
            ),
    );
  }

  Widget _buildResultCard(RecommendationResult item, bool isTop) {
    return Card(
      elevation: isTop ? 8 : 2,
      shadowColor: isTop ? Colors.green.withOpacity(0.4) : null,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: isTop ? const BorderSide(color: Colors.green, width: 2) : BorderSide.none,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (isTop) ...[
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.orange),
                  SizedBox(width: 8),
                  Text("Best Match", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 10),
            ],
            
            // Material
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
                  child: const Icon(Icons.science, color: Colors.blue),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Material", style: TextStyle(fontSize: 12, color: Colors.grey)),
                      Text(item.pcmMaterial, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    ],
                  ),
                )
              ],
            ),
            const Divider(height: 30),

            // Position
            Row(
              children: [
                const Icon(Icons.layers, size: 20, color: Colors.grey),
                const SizedBox(width: 10),
                Expanded(child: Text("Position: ${item.position}", style: const TextStyle(fontWeight: FontWeight.w500))),
              ],
            ),
            const SizedBox(height: 10),
            
            // Justification
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8)),
              child: Text(item.justification, style: TextStyle(color: Colors.grey[800], height: 1.4)),
            ),
            
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Rule #${item.ruleId}", style: const TextStyle(color: Colors.grey, fontSize: 12)),
                Text("Confidence: ${item.confidence}", style: TextStyle(color: Colors.green[700], fontWeight: FontWeight.bold)),
              ],
            ),
             const SizedBox(height: 8),
             Text(item.reference, style: const TextStyle(fontSize: 10, color: Colors.grey, fontStyle: FontStyle.italic)),
          ],
        ),
      ),
    );
  }

  Widget _buildNoResults(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.search_off, size: 60, color: Colors.grey),
          const SizedBox(height: 20),
          const Text("No exact matches found for your inputs."),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Go Back & Modify"),
          )
        ],
      ),
    );
  }
}