class RecommendationResult {
  final String result;
  final String confidence;
  final String justification;
  final int ruleId;

  RecommendationResult({
    required this.result,
    required this.confidence,
    required this.justification,
    required this.ruleId,
  });
}