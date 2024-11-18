import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/self/domain/learning_model.dart';

class LearningProgressSection extends StatelessWidget {
  const LearningProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DesignSystem.cardDecoration,
      padding: const EdgeInsets.all(DesignSystem.spacing3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Learning Progress',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          DesignSystem.vSpacing3,
          ...LearningCategory.values.map((category) => Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spacing3),
            child: _LearningCategoryCard(category: category),
          )),
        ],
      ),
    );
  }
}

class _LearningCategoryCard extends StatelessWidget {
  final LearningCategory category;

  const _LearningCategoryCard({
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spacing3),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(DesignSystem.spacing2),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
            ),
            child: Icon(
              category.icon,
              color: Theme.of(context).colorScheme.primary,
              size: 24,
            ),
          ),
          DesignSystem.hSpacing3,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.displayName,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                DesignSystem.vSpacing2,
                LinearProgressIndicator(
                  value: 0.7, // This will be dynamic later
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary,
                  ),
                ),
                DesignSystem.vSpacing1,
                Text(
                  '12 hours spent', // This will be dynamic later
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
} 