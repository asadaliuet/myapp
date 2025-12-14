class RecommendationResult {
  final int ruleId;
  final String pcmMaterial;
  final String position;
  final String confidence;
  final String justification;
  final String reference;
  final int matchScore; // Used for sorting top results

  RecommendationResult({
    required this.ruleId,
    required this.pcmMaterial,
    required this.position,
    required this.confidence,
    required this.justification,
    required this.reference,
    required this.matchScore,
  });
}