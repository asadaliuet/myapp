import 'package:flutter/material.dart';

class PCMTypeModel {
  final String id;
  final String name;
  final IconData icon;
  final Color color;
  final int ruleCount; // "24 recommendations"
  final String description;
  
  // Stats
  final String tempRange;
  final String latentHeat;
  final String conductivity;
  final String costRange;

  // Lists
  final List<String> advantages;
  final List<String> disadvantages;
  final List<String> applications;

  PCMTypeModel({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
    required this.ruleCount,
    required this.description,
    required this.tempRange,
    required this.latentHeat,
    required this.conductivity,
    required this.costRange,
    required this.advantages,
    required this.disadvantages,
    required this.applications,
  });
}