import 'package:flutter/material.dart';

enum LearningCategory {
  programming,
  design,
  business,
  personal;

  String get displayName {
    switch (this) {
      case LearningCategory.programming:
        return 'Programming';
      case LearningCategory.design:
        return 'Design';
      case LearningCategory.business:
        return 'Business';
      case LearningCategory.personal:
        return 'Personal';
    }
  }

  IconData get icon {
    switch (this) {
      case LearningCategory.programming:
        return Icons.code;
      case LearningCategory.design:
        return Icons.palette;
      case LearningCategory.business:
        return Icons.business;
      case LearningCategory.personal:
        return Icons.person;
    }
  }
}

class LearningProgress {
  final LearningCategory category;
  final double progress;
  final int hoursSpent;
  final List<String> achievements;

  const LearningProgress({
    required this.category,
    required this.progress,
    required this.hoursSpent,
    required this.achievements,
  });
} 