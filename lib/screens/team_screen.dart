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
              name: "Saly Abdou",
              role: "Research Member",
              bio: "An architect and researcher focused on sustainable design, building performance, and smart city technologies. She holds a B.Sc. in Architectural Engineering from Mansoura University and an M.Sc. from KFUPM. She has worked as a Teaching Assistant at both institutions and as a Senior Architect at EMARA Designs. Saly is also a certified LEED Green Associate.",
              borderColor: Colors.green,
            ),
            const TeamMemberCard(
              name: "Sidra Idrees",
              role: "Research Member",
              bio: "An architect and researcher specializing in sustainable materials, building performance, and thermal energy–efficient design. She holds a B.Sc. in Architectural Engineering from UET Lahore and is currently a research student at King Fahd University of Petroleum and Minerals (KFUPM). Her ongoing research focuses on developing a Phase Change Material (PCM) Advisory Application to support energy-efficient building design. Sidra’s interests include climate-responsive architecture, building simulation, and innovative material technologies.",
              borderColor: Colors.purple,
            ),
            const TeamMemberCard(
              name: "Samia",
              role: "Research Member",
              bio: "an Architectural Engineering professional with a Bachelor’s and Master’s degree in the field. She works as a Teaching Assistant, contributing to instruction and research, and has two years of industry experience in estimation. This blend of academic, technical, and practical expertise supports her role in developing the PCM application",
              borderColor: Colors.orange,
            ),
            const TeamMemberCard(
              name: "Sally Gogo",
              role: "Research Member",
              bio: "Sally Gogo is an senior architect and researcher focused on sustainable design,energy modeling and advanced  building envelope, She holds a B.Sc. in Architectural Engineering.",
              borderColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}