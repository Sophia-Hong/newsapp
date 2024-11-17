import 'package:flutter/material.dart';

enum LearningCategory {
  courses,
  videos,
  books,
  notes,
}

class GrowthSpace extends StatelessWidget {
  const GrowthSpace({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Inspiration Message
            Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.secondary.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.auto_awesome,
                    size: 16,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      "You're exploring the world of app development! Keep that curiosity alive.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Learning Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: LearningCategory.values.map((category) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _LearningCard(category: category),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 16),
            // Current Focus
            Row(
              children: [
                Icon(
                  Icons.local_fire_department,
                  size: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Current Focus',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            _CurrentLearningItem(
              title: 'Flutter Development',
              progress: 0.6,
              lastActivity: 'Completed UI/UX Module',
              timeSpent: '2.5h today',
            ),
          ],
        ),
      ),
    );
  }
}

class _LearningCard extends StatelessWidget {
  final LearningCategory category;

  const _LearningCard({required this.category});

  String get _title {
    switch (category) {
      case LearningCategory.courses:
        return 'Courses';
      case LearningCategory.videos:
        return 'Videos';
      case LearningCategory.books:
        return 'Books';
      case LearningCategory.notes:
        return 'Notes';
    }
  }

  IconData get _icon {
    switch (category) {
      case LearningCategory.courses:
        return Icons.school;
      case LearningCategory.videos:
        return Icons.play_circle_outline;
      case LearningCategory.books:
        return Icons.menu_book;
      case LearningCategory.notes:
        return Icons.note_alt_outlined;
    }
  }

  String get _count {
    switch (category) {
      case LearningCategory.courses:
        return '3 Active';
      case LearningCategory.videos:
        return '12 Saved';
      case LearningCategory.books:
        return '4 Reading';
      case LearningCategory.notes:
        return '8 Notes';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            _icon,
            color: Theme.of(context).colorScheme.primary,
            size: 24,
          ),
          const SizedBox(height: 8),
          Text(
            _title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          const SizedBox(height: 4),
          Text(
            _count,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentLearningItem extends StatelessWidget {
  final String title;
  final double progress;
  final String lastActivity;
  final String timeSpent;

  const _CurrentLearningItem({
    required this.title,
    required this.progress,
    required this.lastActivity,
    required this.timeSpent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                timeSpent,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progress,
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            color: Theme.of(context).colorScheme.primary,
            borderRadius: BorderRadius.circular(2),
          ),
          const SizedBox(height: 8),
          Text(
            lastActivity,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
} 