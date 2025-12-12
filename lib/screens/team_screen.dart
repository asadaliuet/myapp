import 'package:flutter/material.dart';
import '../widgets/team_widgets.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meet the Experts'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[50], // Light background
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // 1. Header Section
            const Text(
              "Meet the Experts",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "The PCM recommendation platform is developed by a multidisciplinary team of researchers committed to advancing sustainable building technologies.",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 20),

            // 2. University Badge
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal.shade200),
              ),
              child: Row(
                children: [
                  Icon(Icons.school, color: Colors.teal[800], size: 30),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "King Fahd University of Petroleum & Minerals",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[900],
                            fontSize: 13,
                          ),
                        ),
                        Text(
                          "AECM - Architectural Engineering and Construction Management • Dhahran, Saudi Arabia",
                          style: TextStyle(
                            color: Colors.teal[700],
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // 3. Supervisor Card
            const SupervisorCard(
              name: "Professor Adel Abdelmoneim Mohamed",
              title: "Associate Professor specializing in building science, thermal performance, and sustainable construction technologies. Leading the Building Informatics Research group at KFUPM.",
              bio: "",
              email: "adel.mohamed@kfupm.edu.sa",
              location: "Building 28, Room 2",
            ),

            const SizedBox(height: 40),
            const Text(
              "Research Team",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // 4. Research Team Members
            const TeamMemberCard(
              name: "Abdulrahman Oladapo",
              role: "Research Member",
              bio: "A graduate student in Architectural Engineering at KFUPM, focuses on data-driven sustainable building technologies, particularly building envelope performance in hot-humid climates. He applies machine learning to develop platforms for PCM selection.",
              borderColor: Colors.green,
            ),
            const TeamMemberCard(
              name: "Olatunji Temileyin Charles",
              role: "Research Member",
              bio: "An Architectural Engineer and Project manager with specialization in Integrated systems design and advanced project management. He currently serves as a graduate student with research focus on Building envelopes design.",
              borderColor: Colors.purple,
            ),
            const TeamMemberCard(
              name: "Abdullah Zaki",
              role: "Research Member",
              bio: "An Architect & Project Engineer specializing in sustainable building technologies and machine-learning-driven materials selection. He leads technical office documentation and focuses on high-performance envelopes.",
              borderColor: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}