import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'pcm_info_screen.dart';
import 'guide_screen.dart';
import 'team_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatelessWidget {
  // 1. Add this variable to hold the email
  final String userEmail; 

  // 2. Update constructor to require the email
  const DashboardScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    // Helper to get a simple name from email (e.g., "asad" from "asad@gmail.com")
    final String displayName = userEmail.split('@')[0];

    return Scaffold(
      appBar: AppBar(
        title: const Text('PCM Dashboard'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacement(
                context, 
                MaterialPageRoute(builder: (context) => const LoginScreen())
              );
            },
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.green[700]),
              // 3. Display the formatted name and actual email
              accountName: Text(displayName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              accountEmail: Text(userEmail), 
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  displayName[0].toUpperCase(), // First letter of email
                  style: const TextStyle(fontSize: 24, color: Colors.green, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.calculate),
              title: const Text('Selection Tool'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PCMSelectionHome())),
            ),
             ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Research Team'),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const TeamScreen())),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 4. Update Welcome Text
            Text(
              "Welcome, $displayName",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "What would you like to do today?",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Card 1: Quick Start Guide
            _buildDashboardCard(
              context,
              title: "Quick Start Guide",
              subtitle: "Learn how to use the selection tool efficiently.",
              icon: Icons.rocket_launch,
              color: Colors.orange,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const GuideScreen())),
            ),
            const SizedBox(height: 16),

            // Card 2: PCM Material Info
            _buildDashboardCard(
              context,
              title: "PCM Material Knowledge",
              subtitle: "Explore properties of Paraffins, Salt Hydrates, and more.",
              icon: Icons.library_books,
              color: Colors.blue,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PCMInfoScreen())),
            ),
            const SizedBox(height: 16),

            // Card 3: The Calculator (Original App)
            _buildDashboardCard(
              context,
              title: "Start Selection Tool",
              subtitle: "Calculate recommendations based on climate and position.",
              icon: Icons.calculate,
              color: Colors.green,
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const PCMSelectionHome())),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}