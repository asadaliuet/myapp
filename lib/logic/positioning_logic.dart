import '../models/result_model.dart';

class PositioningLogic {
  static RecommendationResult evaluate({
    String? climateType,
    String? coolingSystem,
    String? wallMaterial,
    String? integrationMethod,
    String? applicationType,
    String? pcmThickness,
    String? wallOrientation,
    String? wallSystemType,
    String? pcmType,
    String? nightTemperature,
    String? thermalResistance,
    String? solarRadiation,
  }) {
    if (climateType == 'hot-dry during summer' && coolingSystem == 'Free running/night ventilation' && wallMaterial == 'perforated bricks') {
      return RecommendationResult(result: 'Behind the inner surface', confidence: 'High', justification: 'Achieves better peak indoor temperature reduction and time delay', ruleId: 61);
    } else if (climateType == 'tropics' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'concrete') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'Achieves heat gain reduction within the walls by 10-40% depending on the PCM thickness', ruleId: 62);
    } else if (climateType == 'very hot during summer and mild during winter' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'geopolymer concrete + insulation materials') {
      return RecommendationResult(result: '50 mm from the outer surface', confidence: 'High', justification: 'Achieves energy reduction by 28-30%', ruleId: 63);
    } else if (coolingSystem == 'Mechanical heating and cooling' && wallMaterial == 'insulation materials' && integrationMethod == 'macro-encapsulated') {
      return RecommendationResult(result: 'Mid-outer layer', confidence: 'High', justification: 'Achieves the best results in peak load shifting and reductions during both heating and cooling seasons', ruleId: 64);
    } else if (climateType == 'very hot during summer' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'bricks with multiple column of holes') {
      return RecommendationResult(result: 'Into the middle holes of the brick holes', confidence: 'High', justification: 'Achieves the highest reduction in the total heat flux by 82%', ruleId: 65);
    } else if (climateType == 'mild summer/winter especially in April' && coolingSystem == 'Free running' && wallMaterial == 'concrete') {
      return RecommendationResult(result: 'In the middle part', confidence: 'High', justification: 'Achieves indoor temperature reduction by 2-4°C and indoor relative humidity reduction by 12%', ruleId: 66);
    } else if (coolingSystem == 'Mechanical cooling' && wallMaterial == 'two to five insulation materials' && integrationMethod == 'macro-encapsulated') {
      return RecommendationResult(result: 'Within cavity between inner surface and insulation layer OR within cavity between first and second insulation layer from inner surface', confidence: 'Medium', justification: 'Helps in the heat discharge process', ruleId: 67);
    } else if (climateType == 'hot-dry during summer' && coolingSystem == 'Free running' && wallMaterial == 'insulation materials') {
      return RecommendationResult(result: 'Behind the inner surface', confidence: 'High', justification: 'Achieves a better reduction in indoor air temperature and the best performance (absorbed internal and external heat)', ruleId: 68);
    } else if (coolingSystem == 'Mechanical cooling' && wallMaterial == 'two insulation materials') {
      return RecommendationResult(result: 'In the middle part', confidence: 'High', justification: 'Achieves peak reduction in the thermal load', ruleId: 69);
    } else if (coolingSystem == 'Mechanical cooling' && wallMaterial == 'wood') {
      return RecommendationResult(result: 'Distributed as: wood-PCM-wood-PCM-external finishes', confidence: 'Medium', justification: 'Achieves the lowest internal surface temperatures and peak heat flux', ruleId: 70);
    } else if (climateType == 'hot-dry during summer' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'five rigid foam insulation materials' && wallOrientation == 'south') {
      return RecommendationResult(result: 'Within cavity between second and third layer from inner surface', confidence: 'Medium', justification: 'Achieve the maximum peak heat flux reduction and maximum peak heat flux delays', ruleId: 71);
    } else if (climateType == 'hot-dry during summer' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'five rigid foam insulation materials' && wallOrientation == 'west') {
      return RecommendationResult(result: 'Within cavity between first and second layer from inner surface', confidence: 'High', justification: 'Optimal positioning for west-facing walls', ruleId: 72);
    } else if (climateType == 'hot-dry during summer' && coolingSystem == 'Mechanical cooling' && wallMaterial == 'five insulation materials' && integrationMethod == 'micro/nano encapsulated' && wallSystemType == 'lightweight type') {
      return RecommendationResult(result: 'In third insulation layer from outer surface', confidence: 'High', justification: 'Achieves maximum temperature reduction during summer', ruleId: 73);
    } else if (climateType == 'cold during winter' && coolingSystem == 'Mechanical heating' && wallMaterial == 'five insulation materials' && integrationMethod == 'micro/nano encapsulated' && wallSystemType == 'lightweight type') {
      return RecommendationResult(result: 'In fourth insulation layer from outer surface', confidence: 'High', justification: 'Achieves maximum temperature reduction during winter', ruleId: 74);
    } else if (wallSystemType == 'ventilated double skin façade' && integrationMethod == 'macro-encapsulated') {
      return RecommendationResult(result: 'Within the cavity', confidence: 'High', justification: 'Reduces energy consumption for summer cooling and winter heating', ruleId: 75);
    } else if (wallMaterial == 'brick masonry wall' && integrationMethod == 'macro-encapsulated') {
      return RecommendationResult(result: 'In the mid layer', confidence: 'High', justification: 'Reduces temperature peaks', ruleId: 76);
    } else if (wallMaterial == 'concrete' && pcmType == 'shape-stabilized PCM (SSPCM)') {
      return RecommendationResult(result: 'Both behind outer and inner surface', confidence: 'Medium', justification: 'Achieve energy savings during summer and winter', ruleId: 77);
    } else if (climateType == 'mediterranean') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'Average energy consumption reduction of 20%', ruleId: 78);
    } else if (applicationType == 'fire resistance' && pcmType == 'paraffinic hydrocarbon') {
      return RecommendationResult(result: 'Behind the inner surface', confidence: 'Medium', justification: 'Mitigates flammability issues', ruleId: 79);
    } else if (applicationType == 'fire resistance' && pcmType == 'micro-encapsulated paraffinic') {
      return RecommendationResult(result: 'In the wall cavity', confidence: 'Medium', justification: 'Safe positioning for fire resistance concerns', ruleId: 80);
    } else if (climateType == 'hot' || climateType == 'cold') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'Leverages the thermal mass to absorb heat during the day and release it at night', ruleId: 81);
    } else if (nightTemperature == 'below 27°C') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'Reduces annual cooling loads by 64%', ruleId: 82);
    } else if (pcmThickness == '1 mm') {
      return RecommendationResult(result: '1/16 of total wall thickness from inner surface', confidence: 'High', justification: 'Reduces wall peak heat flux by 9%', ruleId: 83);
    } else if (pcmThickness == '2 mm') {
      return RecommendationResult(result: '2/16 of total wall thickness from inner surface', confidence: 'High', justification: 'Reduces wall peak heat flux by 36%', ruleId: 84);
    } else if (pcmThickness == '5 to 7 mm') {
      return RecommendationResult(result: '3/16 of total wall thickness from inner surface', confidence: 'High', justification: 'Reduces wall peak heat flux by 55%', ruleId: 85);
    } else if (climateType == 'mediterranean') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'Medium', justification: 'Reduce the heating and cooling loads of building and thus achieve reduced energy usage', ruleId: 86);
    } else if (climateType == 'cold') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'Medium', justification: 'Reduce the heating and cooling loads of building and thus achieve reduced energy usage', ruleId: 87);
    } else if (climateType == 'hot') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'Medium', justification: 'Reduce the heating and cooling loads of building and thus achieve reduced energy usage', ruleId: 88);
    } else if (climateType == 'hot' && coolingSystem == 'Mechanical cooling') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'Enables PCM to work as an insulation layer that reduces the heat gain through the wall', ruleId: 89);
    } else if (climateType == 'cold' && coolingSystem == 'Mechanical heating') {
      return RecommendationResult(result: 'Behind the inner surface', confidence: 'Medium', justification: 'To enable the PCM to work as heat retention layer that keeps the heat inside the space', ruleId: 90);
    } else if (climateType == 'cold' && coolingSystem == 'Free running/night ventilation') {
      return RecommendationResult(result: 'Behind the outer surface', confidence: 'High', justification: 'To help absorb the heat efficiently from the solar temperature acting on the wall, and release it during the night', ruleId: 91);
    } else if (thermalResistance == 'high thermal resistance' && pcmType == 'high melting temperature') {
      return RecommendationResult(result: 'Towards the exterior surface', confidence: 'High', justification: 'To allow the PCM to receive more temperature variation to complete the solidification and melting process', ruleId: 92);
    } else if (climateType == 'cold' && applicationType == 'reducing internal heat during day and reuse at night') {
      return RecommendationResult(result: 'Behind the interior surface OR on the Mid-Interior Layer', confidence: 'High', justification: 'To allow the PCM to directly release energy to the space during the night after absorbing it during the day', ruleId: 93);
    } else if (climateType == 'hot' && applicationType == 'reducing external heat gain') {
      return RecommendationResult(result: 'Behind the exterior surface or on the Mid-Exterior Layer', confidence: 'High', justification: 'Enables PCM to work as an insulation layer that reduces heat gain through the wall and reduce temperature swings', ruleId: 94);
    } else if (climateType == 'cold' && applicationType == 'absorbing external heat during day and reuse at night') {
      return RecommendationResult(result: 'On the Mid-Interior Layer', confidence: 'High', justification: 'Optimal location in absorbing sufficient amount of heat during the day, and release acceptable amount of heat during the night', ruleId: 95);
    } else if (climateType == 'hot' && applicationType == 'reducing external heat gain' && applicationType == 'absorbing external heat during day and reuse at night') {
      return RecommendationResult(result: 'On the Mid-Exterior Layer', confidence: 'High', justification: 'Optimal location in absorbing sufficient amount of heat during the day, and release acceptable amount of heat during the night', ruleId: 96);
    } else if (coolingSystem == 'Free running/night ventilation' && solarRadiation == 'high incident solar radiation') {
      return RecommendationResult(result: 'Towards the interior and away from the middle', confidence: 'High', justification: 'To enable the PCM to work as heat insulation layer that keeps the heat outside the space', ruleId: 97);
    } else if (coolingSystem == 'Mechanical cooling' && thermalResistance == 'high thermal resistance') {
      return RecommendationResult(result: 'Away from the interior and closer to the middle', confidence: 'High', justification: 'To allow the PCM to receive more temperature variation to complete the solidification and melting process', ruleId: 98);
    } else if (climateType == 'cold') {
      return RecommendationResult(result: 'Behind the interior surface or on the Mid-Interior Layer', confidence: 'High', justification: 'To allow the PCM to directly release energy to the space during the night after absorbing it during the day', ruleId: 99);
    } else if (climateType == 'hot') {
      return RecommendationResult(result: 'Behind the exterior surface or on the Mid-Exterior Layer', confidence: 'Medium', justification: 'Enables PCM to work as an insulation layer that reduces heat gain through the wall and reduce temperature swings', ruleId: 100);
    } else if (applicationType == 'reducing internal heat during day and reuse at night') {
      return RecommendationResult(result: 'Behind the interior surface or on the Mid-Interior Layer', confidence: 'Medium', justification: 'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night', ruleId: 101);
    } else if (applicationType == 'reducing external heat gain') {
      return RecommendationResult(result: 'Behind the exterior surface or on the Mid-Exterior Layer', confidence: 'Medium', justification: 'Enables PCM to work as heat retention layer that keeps heat inside space', ruleId: 102);
    } else if (applicationType == 'absorbing external heat during day and reuse at night') {
      return RecommendationResult(result: 'Behind the Mid-Interior Layer or Mid-Exterior Layer', confidence: 'Medium', justification: 'Optimal locations for absorbing sufficient heat during day and releasing acceptable amount during night', ruleId: 103);
    } else if (coolingSystem == 'Free running/night ventilation') {
      return RecommendationResult(result: 'Towards the interior and away from the middle', confidence: 'Medium', justification: 'Helps absorb and store excess heat during day which can be released during night when free cooling is utilized', ruleId: 104);
    } else if (coolingSystem == 'Mechanical cooling') {
      return RecommendationResult(result: 'Away from the interior and towards the middle', confidence: 'Medium', justification: 'Reduces heat transfer from exterior to interior, reducing load on mechanical cooling systems', ruleId: 105);
    } else if (thermalResistance == 'high thermal resistance') {
      return RecommendationResult(result: 'Towards the exterior', confidence: 'Medium', justification: 'Enhances ability to absorb and store heat from external environment, improving thermal performance', ruleId: 106);
    } else if (solarRadiation == 'high incident solar radiation') {
      return RecommendationResult(result: 'Towards the interior', confidence: 'Medium', justification: 'Allows PCM to absorb and store solar heat gain, preventing it from reaching interior spaces', ruleId: 107);
    } else if (pcmType == 'high melting temperature') {
      return RecommendationResult(result: 'Towards the exterior', confidence: 'Medium', justification: 'Facilitates higher heat absorption and storage capacity for high melting temperature PCMs', ruleId: 108);
    } else if (pcmType == 'low melting temperature') {
      return RecommendationResult(result: 'Towards the interior', confidence: 'Medium', justification: 'Allows better utilization of low melting temperature for interior space applications', ruleId: 109);
    } else if (pcmThickness == '1-2 cm') {
      return RecommendationResult(result: 'Towards the exterior', confidence: 'Medium', justification: 'Helps dissipate heat stored in multiple PCM layers, preventing excessive heat buildup', ruleId: 110);
    } else if (applicationType == 'peak temperature reduction' && applicationType == 'heat gain delay') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'High', justification: 'Allows PCM to absorb and delay heat gain, contributing to peak temperature reduction', ruleId: 111);
    } else if (applicationType == 'reducing external heat gain') {
      return RecommendationResult(result: 'Behind the exterior surface', confidence: 'Medium', justification: 'Enhances insulation properties by preventing external heat transfer', ruleId: 112);
    } else if (applicationType == 'temperature swings reduction') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'High', justification: 'Absorbs and releases heat, smoothing out temperature fluctuations and improving thermal comfort', ruleId: 113);
    } else if (applicationType == 'peak load shifting') {
      return RecommendationResult(result: 'Mid-interior Layer', confidence: 'High', justification: 'Allows PCM to absorb and store excess heat during off-peak periods, shifting load to later hours', ruleId: 114);
    } else if (climateType == 'hot-arid' && applicationType == 'reducing external heat gain') {
      return RecommendationResult(result: 'In the middle', confidence: 'Medium', justification: 'Helps reduce total heat flux through wall system, mitigating impact of hot-arid climates', ruleId: 115);
    } else if (thermalResistance == 'high thermal resistance') {
      return RecommendationResult(result: 'Away from the interior and towards the middle', confidence: 'High', justification: 'Reduces total heat flux through wall system in highly insulated walls', ruleId: 116);
    } else if (applicationType == 'space heating' && pcmThickness == '1-2 cm') {
      return RecommendationResult(result: 'Towards the exterior surface', confidence: 'High', justification: 'Enhances insulation properties and minimizes heat transfer to interior spaces', ruleId: 117);
    } else if (nightTemperature == 'around PCM melting temperature') {
      return RecommendationResult(result: 'Mid-Exterior Layer', confidence: 'Medium', justification: 'Absorb and store solar heat gain while ensuring stored heat can be utilized for space heating', ruleId: 118);
    } else if (thermalResistance == 'low thermal resistance' && applicationType == 'heat reduction' && pcmThickness == '1-2 cm') {
      return RecommendationResult(result: 'Towards the exterior surface', confidence: 'High', justification: 'Effectively absorbs and releases heat within temperature range close to melting point', ruleId: 119);
    } else if (wallOrientation == 'south' && wallMaterial == 'high glazed façade') {
      return RecommendationResult(result: 'Behind the interior surface', confidence: 'High', justification: 'Reduces heat transfer through wall by utilizing PCM phase change properties', ruleId: 120);
    }

    // Default
    return RecommendationResult(
      result: 'Middle of the wall (balanced positioning)',
      confidence: 'Medium',
      justification: 'No specific positioning rule matched. General balanced positioning recommended.',
      ruleId: 0,
    );
  }
}