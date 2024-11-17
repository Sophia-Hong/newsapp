import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum HealthCategory {
  nutrition,
  exercise,
  period,
}

class HealthTracker extends StatelessWidget {
  const HealthTracker({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    
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
            // Daily Overview
            Row(
              children: [
                Text(
                  DateFormat('MMM d').format(today),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                _HealthStatus(),
              ],
            ),
            const SizedBox(height: 16),
            // Health Categories
            ...HealthCategory.values.map((category) => _HealthCard(
              category: category,
            )),
          ],
        ),
      ),
    );
  }
}

class _HealthStatus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.favorite,
            size: 14,
            color: Theme.of(context).colorScheme.primary,
          ),
          const SizedBox(width: 4),
          Text(
            'Good',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthCard extends StatelessWidget {
  final HealthCategory category;

  const _HealthCard({
    required this.category,
  });

  String get _title {
    switch (category) {
      case HealthCategory.nutrition:
        return 'Nutrition';
      case HealthCategory.exercise:
        return 'Exercise';
      case HealthCategory.period:
        return 'Period';
    }
  }

  String get _status {
    switch (category) {
      case HealthCategory.nutrition:
        return '1,200 kcal / 2,000 kcal';
      case HealthCategory.exercise:
        return '30 min cardio';
      case HealthCategory.period:
        return 'Day 14 of 28';
    }
  }

  IconData get _icon {
    switch (category) {
      case HealthCategory.nutrition:
        return Icons.restaurant_menu;
      case HealthCategory.exercise:
        return Icons.fitness_center;
      case HealthCategory.period:
        return Icons.calendar_today;
    }
  }

  Color _getColor(BuildContext context) {
    switch (category) {
      case HealthCategory.nutrition:
        return const Color(0xFF9B8AA0);  // Matching app's purple
      case HealthCategory.exercise:
        return const Color(0xFF7C9A92);  // Sage green
      case HealthCategory.period:
        return const Color(0xFFB4838D);  // Soft rose
    }
  }

  String get _additionalInfo {
    switch (category) {
      case HealthCategory.nutrition:
        return 'Protein: 65g • Carbs: 150g • Fat: 50g';
      case HealthCategory.exercise:
        return 'Steps: 8,542 • Calories: 320';
      case HealthCategory.period:
        return 'Next period in 14 days';
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to detailed view
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: color.withOpacity(0.1),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _icon,
                      size: 16,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _title,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        _status,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Icon(
                    Icons.add_circle_outline,
                    size: 20,
                    color: color,
                  ),
                ],
              ),
              if (category != HealthCategory.period) ...[
                const SizedBox(height: 12),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: 0.6,
                    backgroundColor: color.withOpacity(0.1),
                    color: color,
                    minHeight: 4,
                  ),
                ),
              ],
              const SizedBox(height: 8),
              Text(
                _additionalInfo,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 