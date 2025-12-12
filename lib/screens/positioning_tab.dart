import 'package:flutter/material.dart';
import '../data/app_data.dart';
import '../logic/positioning_logic.dart';
import '../models/result_model.dart';
import '../widgets/custom_dropdown.dart';
import '../widgets/result_card.dart';
// import '../widgets/info_header.dart';

class PositioningTab extends StatefulWidget {
  final Animation<double> scaleAnimation;
  const PositioningTab({super.key, required this.scaleAnimation});

  @override
  State<PositioningTab> createState() => _PositioningTabState();
}

class _PositioningTabState extends State<PositioningTab> {
  // Variables
  String? _climateType;
  String? _coolingSystem;
  String? _wallMaterial;
  String? _integrationMethod;
  String? _applicationType;
  String? _pcmThickness;
  String? _wallOrientation;
  String? _wallSystemType;
  String? _pcmType;
  String? _nightTemperature;
  String? _thermalResistance;
  String? _solarRadiation;
  RecommendationResult? _result;

  void _runLogic() {
    setState(() {
      _result = PositioningLogic.evaluate(
        climateType: _climateType,
        coolingSystem: _coolingSystem,
        wallMaterial: _wallMaterial,
        integrationMethod: _integrationMethod,
        applicationType: _applicationType,
        pcmThickness: _pcmThickness,
        wallOrientation: _wallOrientation,
        wallSystemType: _wallSystemType,
        pcmType: _pcmType,
        nightTemperature: _nightTemperature,
        thermalResistance: _thermalResistance,
        solarRadiation: _solarRadiation,
      );
    });
  }

  void reset() {
    setState(() {
      _climateType = null;
      _coolingSystem = null;
      _wallMaterial = null;
      _integrationMethod = null;
      _applicationType = null;
      _pcmThickness = null;
      _wallOrientation = null;
      _wallSystemType = null;
      _pcmType = null;
      _nightTemperature = null;
      _thermalResistance = null;
      _solarRadiation = null;
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // const StudentInfoHeader(),
          const SizedBox(height: 16),
          Card(
            elevation: 4,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'PCM Positioning',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[800],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Group 1
                  CustomDropdown(label: 'Climate Type', items: AppData.climateTypes, value: _climateType, onChanged: (v) => setState(() => _climateType = v)),
                  CustomDropdown(label: 'Cooling System', items: AppData.coolingSystems, value: _coolingSystem, onChanged: (v) => setState(() => _coolingSystem = v)),
                  CustomDropdown(label: 'Wall Material', items: AppData.wallMaterials, value: _wallMaterial, onChanged: (v) => setState(() => _wallMaterial = v)),
                  CustomDropdown(label: 'Integration Method', items: AppData.integrationMethods, value: _integrationMethod, onChanged: (v) => setState(() => _integrationMethod = v)),
                  
                  // Group 2
                  CustomDropdown(label: 'Application Type', items: AppData.applicationTypes, value: _applicationType, onChanged: (v) => setState(() => _applicationType = v)),
                  CustomDropdown(label: 'PCM Thickness', items: AppData.pcmThicknesses, value: _pcmThickness, onChanged: (v) => setState(() => _pcmThickness = v)),
                  CustomDropdown(label: 'Wall Orientation', items: AppData.wallOrientations, value: _wallOrientation, onChanged: (v) => setState(() => _wallOrientation = v)),
                  CustomDropdown(label: 'Wall System Type', items: AppData.wallSystemTypes, value: _wallSystemType, onChanged: (v) => setState(() => _wallSystemType = v)),
                  
                  // Group 3
                  CustomDropdown(label: 'PCM Type', items: AppData.pcmTypes, value: _pcmType, onChanged: (v) => setState(() => _pcmType = v)),
                  CustomDropdown(label: 'Night Temperature', items: AppData.nightTemperatures, value: _nightTemperature, onChanged: (v) => setState(() => _nightTemperature = v)),
                  CustomDropdown(label: 'Thermal Resistance', items: AppData.thermalResistances, value: _thermalResistance, onChanged: (v) => setState(() => _thermalResistance = v)),
                  CustomDropdown(label: 'Solar Radiation', items: AppData.solarRadiations, value: _solarRadiation, onChanged: (v) => setState(() => _solarRadiation = v)),

                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _runLogic,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[600],
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: const Text('Find Optimal PCM Position', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
                title: 'PCM Positioning Recommendation',
                result: _result!.result,
                confidence: _result!.confidence,
                justification: _result!.justification,
                mainIcon: Icons.place,
              ),
            ),
          ],
        ],
      ),
    );
  }
}