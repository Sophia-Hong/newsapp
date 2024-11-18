import 'package:newsapp/features/self/domain/self_model.dart';
import 'package:newsapp/features/self/domain/learning_model.dart';

final List<ReflectionEntry> dummyReflections = [
  ReflectionEntry(
    id: '1',
    type: ReflectionType.gratitude,
    content: 'Grateful for the peaceful morning routine that helps me start each day with clarity.',
    createdAt: DateTime.now().subtract(const Duration(hours: 2)),
    mood: Mood.excellent,
    tags: ['morning', 'routine', 'mindfulness'],
  ),
  ReflectionEntry(
    id: '2',
    type: ReflectionType.learning,
    content: 'Learned about state management in Flutter today. The concepts are starting to click!',
    createdAt: DateTime.now().subtract(const Duration(hours: 5)),
    mood: Mood.good,
    tags: ['coding', 'flutter', 'progress'],
  ),
  ReflectionEntry(
    id: '3',
    type: ReflectionType.challenge,
    content: 'Struggled with complex animations but breaking it down into smaller steps helped.',
    createdAt: DateTime.now().subtract(const Duration(days: 1)),
    mood: Mood.challenging,
    tags: ['coding', 'problem-solving'],
  ),
];

final List<TimeCapsuleEntry> dummyTimeCapsules = [
  TimeCapsuleEntry(
    id: '1',
    title: 'First App Launch',
    content: 'Today marks the beginning of my journey in app development. Future me, I hope you\'re proud of how far we\'ve come!',
    createdAt: DateTime.now().subtract(const Duration(days: 30)),
    openAt: DateTime.now().add(const Duration(days: 365)),
    tags: ['milestone', 'beginnings', 'coding'],
  ),
  TimeCapsuleEntry(
    id: '2',
    title: 'Design Goals 2024',
    content: 'Working on improving my UI/UX skills. Hoping to create more intuitive and beautiful interfaces.',
    createdAt: DateTime.now().subtract(const Duration(days: 15)),
    openAt: DateTime.now().add(const Duration(days: 180)),
    tags: ['design', 'goals', 'learning'],
  ),
];

final List<GrowthMilestone> dummyMilestones = [
  GrowthMilestone(
    id: '1',
    title: 'First Flutter App',
    description: 'Successfully built and deployed my first Flutter application!',
    achievedAt: DateTime.now().subtract(const Duration(days: 60)),
    category: LearningCategory.programming,
    imageUrl: 'https://images.unsplash.com/photo-1517694712202-14dd9538aa97?auto=format&fit=crop&w=800&q=80',
    tags: ['flutter', 'milestone', 'coding'],
  ),
  GrowthMilestone(
    id: '2',
    title: 'UI Design Principles',
    description: 'Completed comprehensive course on UI/UX design fundamentals',
    achievedAt: DateTime.now().subtract(const Duration(days: 30)),
    category: LearningCategory.design,
    imageUrl: 'https://images.unsplash.com/photo-1581291518633-83b4ebd1d83e?auto=format&fit=crop&w=800&q=80',
    tags: ['design', 'learning', 'ui-ux'],
  ),
];

final List<LearningProgress> dummyLearningProgress = [
  LearningProgress(
    category: LearningCategory.programming,
    progress: 0.7,
    hoursSpent: 120,
    achievements: [
      'Completed Flutter Basics',
      'Built First App',
      'Mastered State Management',
    ],
  ),
  LearningProgress(
    category: LearningCategory.design,
    progress: 0.5,
    hoursSpent: 85,
    achievements: [
      'UI Design Fundamentals',
      'Color Theory',
      'Typography Basics',
    ],
  ),
  LearningProgress(
    category: LearningCategory.business,
    progress: 0.3,
    hoursSpent: 45,
    achievements: [
      'Startup Basics',
      'Market Research',
    ],
  ),
  LearningProgress(
    category: LearningCategory.personal,
    progress: 0.6,
    hoursSpent: 90,
    achievements: [
      'Morning Routine',
      'Meditation Practice',
      'Reading Habit',
    ],
  ),
]; 