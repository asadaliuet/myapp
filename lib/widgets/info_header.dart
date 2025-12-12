import 'package:flutter/material.dart';

class StudentInfoHeader extends StatelessWidget {
  const StudentInfoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.green[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color.fromARGB(255, 173, 200, 174)),
      ),
      child: Column(
        children: [
          Text(
            'Students: Sidra Idress, Samia, Sally Gogo, Saly Abdou',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.green[900],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            'Supervisor: Dr. Adel Abdou',
            style: TextStyle(
              fontSize: 13,
              color: Colors.green[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}