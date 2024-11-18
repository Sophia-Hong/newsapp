import 'package:flutter/material.dart';
import 'package:newsapp/features/connect/domain/connect_model.dart';

final List<LikeMindedProfile> dummyLikeMindedProfiles = [
  LikeMindedProfile(
    id: '1',
    name: 'Alex Kim',
    imageUrl: 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?auto=format&fit=crop&w=150&q=80',
    keywords: ['AI', 'Design', 'Innovation'],
    interests: ['Technology', 'Art', 'Music'],
    matchScore: 0.85,
  ),
  LikeMindedProfile(
    id: '2',
    name: 'Jordan Lee',
    imageUrl: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=150&q=80',
    keywords: ['Flutter', 'UX', 'Startups'],
    interests: ['Coding', 'Design', 'Business'],
    matchScore: 0.82,
  ),
  LikeMindedProfile(
    id: '3',
    name: 'Taylor Chen',
    imageUrl: 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?auto=format&fit=crop&w=150&q=80',
    keywords: ['AI', 'Music', 'Art'],
    interests: ['Technology', 'Piano', 'Design'],
    matchScore: 0.78,
  ),
  LikeMindedProfile(
    id: '4',
    name: 'Sam Park',
    imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?auto=format&fit=crop&w=150&q=80',
    keywords: ['Design', 'Tech', 'Innovation'],
    interests: ['UX/UI', 'Startups', 'Art'],
    matchScore: 0.75,
  ),
  LikeMindedProfile(
    id: '5',
    name: 'Robin Zhang',
    imageUrl: 'https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=150&q=80',
    keywords: ['AI', 'Business', 'Tech'],
    interests: ['Innovation', 'Startups', 'Design'],
    matchScore: 0.72,
  ),
];

final List<KeywordCommunity> dummyKeywordCommunities = [
  KeywordCommunity(
    id: '1',
    keyword: 'AI & Innovation',
    memberCount: 1243,
    recentTopics: ['Future of AI', 'Ethics in AI', 'AI in Design'],
    isJoined: true,
    icon: Icons.auto_awesome,
  ),
  KeywordCommunity(
    id: '2',
    keyword: 'Design Thinking',
    memberCount: 856,
    recentTopics: ['UX Research', 'Design Systems', 'UI Trends'],
    icon: Icons.palette,
  ),
  KeywordCommunity(
    id: '3',
    keyword: 'Tech Startups',
    memberCount: 967,
    recentTopics: ['Funding', 'Growth Strategies', 'Innovation'],
    icon: Icons.rocket_launch,
  ),
];

final List<JobOpportunity> dummyJobOpportunities = [
  JobOpportunity(
    id: '1',
    title: 'AI Product Designer',
    company: 'TechVision Inc.',
    location: 'Seoul, Korea',
    matchingKeywords: ['AI', 'Design', 'Innovation'],
    matchScore: 0.88,
    isRemote: true,
    postedAt: DateTime.now().subtract(const Duration(days: 2)),
    requiredSkills: ['UI/UX Design', 'AI Tools', 'Figma'],
    preferredSkills: ['Flutter', 'Design Systems', 'Prototyping'],
  ),
  JobOpportunity(
    id: '2',
    title: 'Creative Technologist',
    company: 'Innovation Lab',
    location: 'Singapore',
    matchingKeywords: ['Tech', 'Design', 'Innovation'],
    matchScore: 0.85,
    isRemote: true,
    postedAt: DateTime.now().subtract(const Duration(days: 1)),
    requiredSkills: ['Programming', 'Design Thinking', 'Problem Solving'],
    preferredSkills: ['AI/ML', 'AR/VR', 'Creative Coding'],
  ),
]; 