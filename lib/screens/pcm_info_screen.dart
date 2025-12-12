import 'package:flutter/material.dart';
import '../data/pcm_info_data.dart';
import '../models/pcm_type_model.dart';

class PCMInfoScreen extends StatefulWidget {
  const PCMInfoScreen({super.key});

  @override
  State<PCMInfoScreen> createState() => _PCMInfoScreenState();
}

class _PCMInfoScreenState extends State<PCMInfoScreen> {
  int _selectedIndex = 0; // Default to first (Paraffin)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PCM Material Info'),
        backgroundColor: Colors.green[700],
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          // 1. Horizontal Category Selector
          Container(
            height: 110,
            color: Colors.white,
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              scrollDirection: Axis.horizontal,
              itemCount: PCMInfoData.pcmTypes.length,
              separatorBuilder: (c, i) => const SizedBox(width: 12),
              itemBuilder: (context, index) {
                final item = PCMInfoData.pcmTypes[index];
                final isSelected = index == _selectedIndex;
                return GestureDetector(
                  onTap: () => setState(() => _selectedIndex = index),
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.green[50] : Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: isSelected ? Colors.green : Colors.grey.shade300,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: item.color,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(item.icon, color: Colors.white, size: 24),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          item.name.split(' ').first, // Show short name
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            color: isSelected ? Colors.green[900] : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          
          // 2. Detail View
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: _buildDetailView(PCMInfoData.pcmTypes[_selectedIndex]),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDetailView(PCMTypeModel pcm) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: pcm.color,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(pcm.icon, color: Colors.white, size: 32),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pcm.name,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      "${pcm.ruleCount} recommendations in database",
                      style: TextStyle(color: Colors.blue[800], fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 16),
        Text(
          pcm.description,
          style: TextStyle(color: Colors.grey[700], height: 1.4),
        ),
        const SizedBox(height: 24),

        // Stats Grid
        Row(
          children: [
            _buildStatCard("Temp Range", pcm.tempRange, Icons.thermostat, Colors.teal),
            const SizedBox(width: 8),
            _buildStatCard("Latent Heat", pcm.latentHeat, Icons.flash_on, Colors.orange),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            _buildStatCard("Conductivity", pcm.conductivity, Icons.shield, Colors.blue),
            const SizedBox(width: 8),
            _buildStatCard("Cost Range", pcm.costRange, Icons.attach_money, Colors.green),
          ],
        ),
        const SizedBox(height: 24),

        // Tabs Section (Advantages, Disadvantages, Applications)
        DefaultTabController(
          length: 3,
          child: Column(
            children: [
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TabBar(
                  indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 2)],
                  ),
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[600],
                  labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  tabs: const [
                    Tab(text: "Advantages"),
                    Tab(text: "Disadvantages"),
                    Tab(text: "Applications"),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 250, // Fixed height for tab view
                child: TabBarView(
                  children: [
                    _buildList(pcm.advantages, Icons.check_circle_outline, Colors.green),
                    _buildList(pcm.disadvantages, Icons.cancel_outlined, Colors.red),
                    _buildList(pcm.applications, Icons.business, Colors.blue),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildStatCard(String label, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildList(List<String> items, IconData icon, Color iconColor) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 18),
              const SizedBox(width: 8),
              Expanded(
                child: Text(items[index], style: const TextStyle(fontSize: 13, height: 1.3)),
              ),
            ],
          ),
        );
      },
    );
  }
}