import 'package:flutter/material.dart';
import 'pcm_info_screen.dart'; // Knowledge Base
import 'guide_screen.dart'; // Quick Guide
import 'team_screen.dart'; // Team Page
import 'login_screen.dart'; // For Logout
// NEW WIZARD IMPORTS
import 'wizard/wizard_state.dart';
import 'wizard/step_screens.dart';

class DashboardScreen extends StatelessWidget {
  final String userEmail;

  const DashboardScreen({super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    // Extract name from email (e.g., "asad" from "asad@gmail.com")
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
                MaterialPageRoute(builder: (context) => const LoginScreen()),
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
              accountName: Text(
                displayName.toUpperCase(),
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              accountEmail: Text(userEmail),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  displayName[0].toUpperCase(),
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.green[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.rocket_launch), // Wizard Icon
              title: const Text('Selection Wizard'),
              onTap: () {
                Navigator.pop(context); // Close drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Step1Building(state: WizardState()),
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.library_books),
              title: const Text('Material Knowledge'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PCMInfoScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text('Meet the Experts'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const TeamScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Welcome, $displayName",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Select a tool to begin your analysis.",
              style: TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Card 1: Quick Start Guide
            _buildDashboardCard(
              context,
              title: "Quick Start Guide",
              subtitle: "Learn how to use the selection tool efficiently.",
              icon: Icons.lightbulb_outline,
              color: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const GuideScreen()),
              ),
            ),
            const SizedBox(height: 16),

            // Card 2: PCM Knowledge Base
            _buildDashboardCard(
              context,
              title: "PCM Knowledge Base",
              subtitle: "Properties of Paraffins, Salt Hydrates, and Fatty Acids.",
              icon: Icons.menu_book,
              color: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const PCMInfoScreen()),
              ),
            ),
            const SizedBox(height: 16),

            // Card 3: The New Wizard Tool
            _buildDashboardCard(
              context,
              title: "Start Selection Tool",
              subtitle: "AI-Powered PCM Recommendation Wizard (60 Rules).",
              icon: Icons.auto_awesome,
              color: Colors.green,
              onTap: () {
                // START THE WIZARD FLOW HERE
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => Step1Building(state: WizardState()),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(
    BuildContext context, {
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
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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