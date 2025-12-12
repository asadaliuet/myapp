import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../logic/material_logic.dart';
import '../models/result_model.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/result_card.dart';
import '../widgets/info_header.dart';

class MaterialSelectionTab extends StatefulWidget {
  final Animation<double> scaleAnimation;
  const MaterialSelectionTab({super.key, required this.scaleAnimation});

  @override
  State<MaterialSelectionTab> createState() => _MaterialSelectionTabState();
}

class _MaterialSelectionTabState extends State<MaterialSelectionTab> {
  String? _buildingType;
  String? _regionTemperature;
  String? _buildingMaterial;
  String? _priorityAspect;
  RecommendationResult? _result;

  void _runLogic() {
    setState(() {
      _result = MaterialLogic.evaluate(
        buildingType: _buildingType,
        regionTemperature: _regionTemperature,
        buildingMaterial: _buildingMaterial,
        priorityAspect: _priorityAspect,
      );
    });
  }

  // Exposed via GlobalKey for reset
  void reset() {
    setState(() {
      _buildingType = null;
      _regionTemperature = null;
      _buildingMaterial = null;
      _priorityAspect = null;
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const StudentInfoHeader(),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'PCM Material Selection',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  CustomDropdown(
                    label: 'Building Type',
                    items: AppData.buildingTypes,
                    value: _buildingType,
                    onChanged: (v) => setState(() => _buildingType = v),
                  ),
                  CustomDropdown(
                    label: 'Region Temperature',
                    items: AppData.regionTemperatures,
                    value: _regionTemperature,
                    onChanged: (v) => setState(() => _regionTemperature = v),
                  ),
                  CustomDropdown(
                    label: 'Building Material',
                    items: AppData.buildingMaterials,
                    value: _buildingMaterial,
                    onChanged: (v) => setState(() => _buildingMaterial = v),
                  ),
                  CustomDropdown(
                    label: 'Priority Aspect',
                    items: AppData.priorityAspects,
                    value: _priorityAspect,
                    onChanged: (v) => setState(() => _priorityAspect = v),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _runLogic,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text(
                      'Find Recommended PCM Material',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (_result != null) ...[
            const SizedBox(height: 20),
            ScaleTransition(
              scale: widget.scaleAnimation,
              child: ResultDisplayCard(
                title: 'PCM Material Recommendation',
                result: _result!.result,
                confidence: _result!.confidence,
                justification: _result!.justification,
                mainIcon: Icons.architecture,
              ),
            ),
          ],
        ],
      ),
    );
  }
}