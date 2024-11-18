import 'package:flutter/material.dart';
import 'package:newsapp/features/self/domain/learning_model.dart';

enum ReflectionType {
  gratitude,
  learning,
  challenge,
  achievement,
  futureLetter;

  String get displayName {
    switch (this) {
      case ReflectionType.gratitude:
        return 'Gratitude';
      case ReflectionType.learning:
        return 'Learning';
      case ReflectionType.challenge:
        return 'Challenge';
      case ReflectionType.achievement:
        return 'Achievement';
      case ReflectionType.futureLetter:
        return 'Letter to Future';
    }
  }

  IconData get icon {
    switch (this) {
      case ReflectionType.gratitude:
        return Icons.favorite;
      case ReflectionType.learning:
        return Icons.school;
      case ReflectionType.challenge:
        return Icons.fitness_center;
      case ReflectionType.achievement:
        return Icons.emoji_events;
      case ReflectionType.futureLetter:
        return Icons.mail;
    }
  }
}

class ReflectionEntry {
  final String id;
  final ReflectionType type;
  final String content;
  final DateTime createdAt;
  final String? imageUrl;
  final List<String> tags;
  final Mood mood;

  const ReflectionEntry({
    required this.id,
    required this.type,
    required this.content,
    required this.createdAt,
    this.imageUrl,
    this.tags = const [],
    required this.mood,
  });
}

enum Mood {
  excellent,
  good,
  neutral,
  challenging,
  difficult;

  String get emoji {
    switch (this) {
      case Mood.excellent:
        return '🌟';
      case Mood.good:
        return '😊';
      case Mood.neutral:
        return '😐';
      case Mood.challenging:
        return '😓';
      case Mood.difficult:
        return '😔';
    }
  }
}

class TimeCapsuleEntry {
  final String id;
  final String title;
  final String content;
  final DateTime createdAt;
  final DateTime openAt;
  final List<String> attachments;
  final List<String> tags;

  const TimeCapsuleEntry({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
    required this.openAt,
    this.attachments = const [],
    this.tags = const [],
  });
}

class GrowthMilestone {
  final String id;
  final String title;
  final String description;
  final DateTime achievedAt;
  final LearningCategory category;
  final String? imageUrl;
  final List<String> tags;

  const GrowthMilestone({
    required this.id,
    required this.title,
    required this.description,
    required this.achievedAt,
    required this.category,
    this.imageUrl,
    this.tags = const [],
  });
} 