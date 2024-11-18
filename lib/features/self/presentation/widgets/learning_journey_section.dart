import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/self/data/dummy_self_data.dart';
import 'package:newsapp/features/self/domain/learning_model.dart';

class LearningJourneySection extends StatelessWidget {
  const LearningJourneySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: DesignSystem.spacing3,
            bottom: DesignSystem.spacing2,
          ),
          child: Text(
            'Learning Journey',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(DesignSystem.spacing3),
          decoration: DesignSystem.cardDecoration,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Currently Learning',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
              DesignSystem.vSpacing3,
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: DesignSystem.spacing3,
                crossAxisSpacing: DesignSystem.spacing3,
                childAspectRatio: 1.1,
                children: dummyLearningProgress.map((progress) => 
                  _LearningProgressCard(progress: progress),
                ).toList(),
              ),
              DesignSystem.vSpacing3,
              FilledButton.icon(
                onPressed: () {
                  // TODO: Add new learning goal
                },
                icon: const Icon(Icons.add, size: 18),
                label: const Text('Add Learning Goal'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _LearningProgressCard extends StatelessWidget {
  final LearningProgress progress;

  const _LearningProgressCard({
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(DesignSystem.spacing2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress.progress,
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  strokeWidth: 6,
                ),
              ),
              Icon(
                progress.category.icon,
                color: Theme.of(context).colorScheme.primary,
                size: 24,
              ),
            ],
          ),
          DesignSystem.vSpacing2,
          Text(
            progress.category.displayName,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          DesignSystem.vSpacing1,
          Text(
            '${progress.hoursSpent}h spent',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
        ],
      ),
    );
  }
} 