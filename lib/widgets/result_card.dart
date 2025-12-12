import 'package:flutter/material.dart';

class ResultDisplayCard extends StatelessWidget {
  final String title;
  final String result;
  final String confidence;
  final String justification;
  final IconData mainIcon;

  const ResultDisplayCard({
    super.key,
    required this.title,
    required this.result,
    required this.confidence,
    required this.justification,
    required this.mainIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(mainIcon, color: Colors.green, size: 24),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _buildItem('Recommendation:', result, Icons.star),
            _buildItem(
              'Confidence Level:',
              confidence,
              confidence == 'High' ? Icons.verified : Icons.help_outline,
            ),
            _buildItem('Justification:', justification, Icons.lightbulb),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String label, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 20, color: Colors.green[600]),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 4),
                Text(value, style: TextStyle(color: Colors.grey[800])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}