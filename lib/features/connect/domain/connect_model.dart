import 'package:flutter/material.dart';

class LikeMindedProfile {
  final String id;
  final String name;
  final String? imageUrl;
  final List<String> keywords;
  final List<String> interests;
  final bool isFollowing;
  final double matchScore;

  const LikeMindedProfile({
    required this.id,
    required this.name,
    this.imageUrl,
    required this.keywords,
    required this.interests,
    this.isFollowing = false,
    required this.matchScore,
  });
}

class KeywordCommunity {
  final String id;
  final String keyword;
  final int memberCount;
  final List<String> recentTopics;
  final bool isJoined;
  final IconData icon;

  const KeywordCommunity({
    required this.id,
    required this.keyword,
    required this.memberCount,
    required this.recentTopics,
    this.isJoined = false,
    required this.icon,
  });
}

class JobOpportunity {
  final String id;
  final String title;
  final String company;
  final String location;
  final List<String> matchingKeywords;
  final double matchScore;
  final bool isRemote;
  final DateTime postedAt;
  final List<String> requiredSkills;
  final List<String> preferredSkills;

  const JobOpportunity({
    required this.id,
    required this.title,
    required this.company,
    required this.location,
    required this.matchingKeywords,
    required this.matchScore,
    required this.isRemote,
    required this.postedAt,
    required this.requiredSkills,
    required this.preferredSkills,
  });
} 