import 'package:flutter/material.dart';

// 1. The Supervisor Card (The dark teal one)
class SupervisorCard extends StatelessWidget {
  final String name;
  final String title;
  final String bio;
  final String email;
  final String location;

  const SupervisorCard({
    super.key,
    required this.name,
    required this.title,
    required this.bio,
    required this.email,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF00897B), // Dark Teal color from image
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          const Chip(
            label: Text("Research Facilitator", style: TextStyle(color: Colors.teal)),
            backgroundColor: Colors.white,
          ),
          const SizedBox(height: 16),
          // Profile Image Placeholder
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.white,
            child: Icon(Icons.person, size: 60, color: Colors.grey),
            // Use NetworkImage or AssetImage here in real app
          ),
          const SizedBox(height: 16),
          Text(
            name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white70,
              height: 1.4,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          // Contact Info
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.email_outlined, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(email, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on_outlined, color: Colors.white70, size: 16),
              const SizedBox(width: 4),
              Text(location, style: const TextStyle(color: Colors.white70, fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}

// 2. The Team Member Card (The white ones with colored borders)
class TeamMemberCard extends StatelessWidget {
  final String name;
  final String role;
  final String bio;
  final Color borderColor;

  const TeamMemberCard({
    super.key,
    required this.name,
    required this.role,
    required this.bio,
    required this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor, width: 2),
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: const Color(0xFFE0F2F1),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              role,
              style: const TextStyle(
                color: Colors.teal,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            bio,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[700],
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          const Divider(),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: () {}, icon: const Icon(Icons.email_outlined, size: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.phone_outlined, size: 20)),
              IconButton(onPressed: () {}, icon: const Icon(Icons.link, size: 20)), // LinkedIn placeholder
            ],
          )
        ],
      ),
    );
  }
}