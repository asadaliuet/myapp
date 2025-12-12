class AppData {
  static const List<String> buildingTypes = [
    'residential', 'office', 'commercial', 'industrial',
  ];

  static const List<String> regionTemperatures = [
    'cold (-10°C to 10°C)', 'cold (-5°C to 15°C)', 
    'moderate (10°C to 30°C)', 'hot (25°C to 40°C)', 'hot (30°C to 45°C)',
  ];

  static const List<String> buildingMaterials = [
    'brick', 'wood', 'concrete', 'insulation', 'curtain wall',
  ];

  static const List<String> priorityAspects = [
    'technical', 'economical', 'chemical properties', 
    'thermodynamic', 'kinetic properties',
  ];

  static const List<String> climateTypes = [
    'hot-dry during summer', 'tropics', 
    'very hot during summer and mild during winter',
    'mild summer/winter especially in April', 'cold during winter',
    'mediterranean', 'hot', 'cold', 'hot-arid',
  ];

  static const List<String> coolingSystems = [
    'Free running/night ventilation', 'Mechanical cooling',
    'Mechanical heating and cooling', 'Mechanical heating', 'Free running',
  ];

  static const List<String> wallMaterials = [
    'perforated bricks', 'concrete', 'geopolymer concrete + insulation materials',
    'insulation materials', 'bricks with multiple column of holes',
    'two to five insulation materials', 'five rigid foam insulation materials',
    'wood', 'brick masonry wall', 'two insulation materials', 
    'five insulation materials', 'high glazed façade'
  ];

  static const List<String> integrationMethods = [
    'macro-encapsulated', 'micro/nano encapsulated', 
    'shape-stabilized PCM (SSPCM)',
  ];

  static const List<String> applicationTypes = [
    'reducing internal heat during day and reuse at night',
    'reducing external heat gain',
    'absorbing external heat during day and reuse at night',
    'peak temperature reduction', 'peak load shifting',
    'temperature swings reduction', 'heat gain delay',
    'space heating', 'heat reduction', 'fire resistance'
  ];

  static const List<String> pcmThicknesses = ['1 mm', '2 mm', '5 to 7 mm', '1-2 cm'];
  static const List<String> wallOrientations = ['south', 'west', 'north', 'east'];
  
  static const List<String> wallSystemTypes = [
    'ventilated double skin façade', 'lightweight type',
  ];

  static const List<String> pcmTypes = [
    'paraffinic hydrocarbon', 'micro-encapsulated paraffinic',
    'shape-stabilized PCM (SSPCM)', 'high melting temperature',
    'low melting temperature',
  ];

  static const List<String> nightTemperatures = [
    'below 27°C', 'above 27°C', 'around PCM melting temperature',
  ];

  static const List<String> thermalResistances = [
    'high thermal resistance', 'low thermal resistance',
  ];

  static const List<String> solarRadiations = [
    'high incident solar radiation', 'low incident solar radiation',
  ];
}