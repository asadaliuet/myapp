import '../models/result_model.dart';

class MaterialLogic {
  static RecommendationResult evaluate({
    required String? buildingType,
    required String? regionTemperature,
    required String? buildingMaterial,
    required String? priorityAspect,
  }) {
    if (buildingType == 'residential' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'sodium nitrate/potassium nitrate eutectic mixture', confidence: 'High', justification: 'Eutectic mixtures provide stable phase change temperatures and high heat storage capacity.', ruleId: 1);
    } else if (buildingType == 'office' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Cost-effective for reducing cooling loads in wooden office buildings.', ruleId: 2);
    } else if (buildingType == 'commercial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'insulation' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'High', justification: 'Good chemical stability for insulation in cold climates.', ruleId: 3);
    } else if (buildingType == 'industrial' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'concrete' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Excellent thermodynamic properties for concrete industrial buildings.', ruleId: 4);
    } else if (buildingType == 'residential' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'wood' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'Medium', justification: 'Rapid kinetics for efficient heat transfer in wooden buildings.', ruleId: 5);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'concrete' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Good compatibility with concrete structures in cold climates.', ruleId: 6);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'brick' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Cost-effective thermal regulation for brick commercial buildings.', ruleId: 7);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'insulation' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Excellent thermodynamic properties for insulation materials.', ruleId: 8);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'wood' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'High', justification: 'Good chemical stability for wooden residential buildings in cold climates.', ruleId: 9);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'concrete' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Cost-effective for reducing cooling loads in concrete offices.', ruleId: 10);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'wood' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good thermal conductivity and easy integration with wood structures.', ruleId: 11);
    } else if (buildingType == 'office' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'concrete' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium sulfate decahydrate', confidence: 'High', justification: 'Cost-effective with high heat absorption capacity.', ruleId: 12);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'sodium nitrate/potassium nitrate eutectic mixture', confidence: 'High', justification: 'Stable phase change temperatures for moderate climates.', ruleId: 13);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'insulation' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'magnesium chloride hexahydrate', confidence: 'Medium', justification: 'Good chemical stability for industrial applications.', ruleId: 14);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'curtain wall' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'High', justification: 'Fast kinetics for rapid heat absorption in curtain walls.', ruleId: 15);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'concrete' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good compatibility with concrete structures.', ruleId: 16);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Relatively inexpensive for commercial building applications.', ruleId: 17);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'insulation' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'Medium', justification: 'Good chemical stability for industrial insulation.', ruleId: 18);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'brick' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'sodium nitrate/potassium nitrate eutectic mixture', confidence: 'High', justification: 'High heat storage capacity for cold climate comfort.', ruleId: 19);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'concrete' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Cost-effective for peak cooling load reduction.', ruleId: 20);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'wood' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'fatty acids', confidence: 'High', justification: 'Good kinetic properties for rapid heat transfer.', ruleId: 21);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'insulation' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'sodium sulfate decahydrate', confidence: 'High', justification: 'Excellent thermodynamic properties for cold industrial environments.', ruleId: 22);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'brick' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good compatibility with brick structures in hot climates.', ruleId: 23);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Cost-effective for wood-based office buildings.', ruleId: 24);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'concrete' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'magnesium nitrate hexahydrate/potassium nitrate eutectic mixture', confidence: 'High', justification: 'Good chemical stability for harsh hot climate conditions.', ruleId: 25);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'insulation' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Readily available and cost-effective for insulation.', ruleId: 26);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'wood' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'Medium', justification: 'Fast kinetics for quick heat transfer in cold climates.', ruleId: 27);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'brick' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin-based PCM (e.g., hexadecane)', confidence: 'High', justification: 'Suitable melting temperatures and excellent thermal cycling stability.', ruleId: 28);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'concrete' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good compatibility with concrete structures for thermal storage.', ruleId: 29);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'insulation' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'fatty acids', confidence: 'Medium', justification: 'Rapid kinetics for efficient heat transfer in cold environments.', ruleId: 30);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Cost-effective integration into wood-based residential buildings.', ruleId: 31);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'brick' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'High', justification: 'Good chemical stability for brick walls in cold climates.', ruleId: 32);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'wood' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good thermodynamic properties for wood structures in hot climates.', ruleId: 33);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'concrete' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'fatty acids', confidence: 'Medium', justification: 'Rapid kinetics for concrete structures in moderate climates.', ruleId: 34);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'insulation' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Cost-effective integration into insulation materials.', ruleId: 35);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'brick' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'Medium', justification: 'Fast kinetics for rapid heat transfer in brick walls.', ruleId: 36);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'wood' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Good compatibility with wood structures for technical performance.', ruleId: 37);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'concrete' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Excellent thermodynamic properties for concrete in cold environments.', ruleId: 38);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'insulation' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'fatty acids', confidence: 'Medium', justification: 'Good chemical stability for insulation in hot environments.', ruleId: 39);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'wood' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'High', justification: 'Fast kinetics for rapid heat transfer in wood structures.', ruleId: 40);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'brick' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Cost-effective thermal regulation for brick commercial buildings.', ruleId: 41);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'insulation' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Readily available and cost-effective for moderate climates.', ruleId: 42);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'concrete' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'Medium', justification: 'Good chemical stability for concrete in cold climates.', ruleId: 43);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'wood' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good compatibility with wood structures for technical performance.', ruleId: 44);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'Medium', justification: 'Rapid kinetics for efficient heat transfer in brick walls.', ruleId: 45);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'High', justification: 'Cost-effective integration into wood structures.', ruleId: 46);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'concrete' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Excellent thermodynamic properties for concrete structures.', ruleId: 47);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'brick' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'High', justification: 'Good chemical stability for reliable thermal regulation.', ruleId: 48);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Cost-effective thermal regulation for wood structures.', ruleId: 49);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good thermodynamic properties for brick structures.', ruleId: 50);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'insulation' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'stearic acid', confidence: 'Medium', justification: 'Good chemical stability for insulation materials.', ruleId: 51);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'wood' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good compatibility with wood structures for technical performance.', ruleId: 52);
    } else if (buildingType == 'commercial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'High', justification: 'Rapid kinetics for efficient heat transfer in brick walls.', ruleId: 53);
    } else if (buildingType == 'industrial' && regionTemperature == 'cold (-10°C to 10°C)' && buildingMaterial == 'wood' && priorityAspect == 'economical') {
      return RecommendationResult(result: 'sodium acetate trihydrate', confidence: 'Medium', justification: 'Cost-effective integration into wood structures.', ruleId: 54);
    } else if (buildingType == 'residential' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'insulation' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Excellent thermodynamic properties for insulation.', ruleId: 55);
    } else if (buildingType == 'office' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'concrete' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'bio-based fatty acids', confidence: 'High', justification: 'Rapid kinetics for efficient heat transfer in concrete.', ruleId: 56);
    } else if (buildingType == 'commercial' && regionTemperature == 'hot (25°C to 40°C)' && buildingMaterial == 'wood' && priorityAspect == 'chemical properties') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good chemical stability for reliable thermal regulation.', ruleId: 57);
    } else if (buildingType == 'industrial' && regionTemperature == 'moderate (10°C to 30°C)' && buildingMaterial == 'brick' && priorityAspect == 'thermodynamic') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'High', justification: 'Good thermodynamic properties for brick structures.', ruleId: 58);
    } else if (buildingType == 'residential' && regionTemperature == 'cold (-5°C to 15°C)' && buildingMaterial == 'insulation' && priorityAspect == 'kinetic properties') {
      return RecommendationResult(result: 'fatty acids', confidence: 'High', justification: 'Rapid kinetics for efficient heat storage.', ruleId: 59);
    } else if (buildingType == 'office' && regionTemperature == 'hot (30°C to 45°C)' && buildingMaterial == 'concrete' && priorityAspect == 'technical') {
      return RecommendationResult(result: 'paraffin wax', confidence: 'Medium', justification: 'Good compatibility with concrete structures.', ruleId: 60);
    }
    
    // Default
    return RecommendationResult(
      result: 'paraffin wax',
      confidence: 'Medium',
      justification: 'No specific rule matched. General purpose PCM recommended.',
      ruleId: 0,
    );
  }
}