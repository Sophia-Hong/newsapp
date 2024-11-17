import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TodoCategory {
  work,
  personal,
  family,
}

class TodoSection extends StatelessWidget {
  const TodoSection({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final weekDays = List.generate(
      7,
      (index) => today.add(Duration(days: index - today.weekday + 1)),
    );
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${DateFormat('MMM d').format(today)}, To-do',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 8),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Calendar Section
                Text(
                  DateFormat('MMMM').format(today),
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: weekDays.map((date) {
                    final isToday = date.day == today.day;
                    final dayName = DateFormat('E').format(date)[0];
                    return Column(
                      children: [
                        Text(
                          dayName,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                            fontSize: 10,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Container(
                          width: 32,
                          height: 32,
                          decoration: isToday ? BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            shape: BoxShape.circle,
                          ) : null,
                          child: Center(
                            child: Text(
                              '${date.day}',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                color: isToday 
                                    ? Colors.white
                                    : Theme.of(context).colorScheme.onSurface,
                                fontWeight: isToday ? FontWeight.w600 : null,
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                // Todo List Section
                Row(
                  children: [
                    Text(
                      '2/4 tasks',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    const Spacer(),
                    Row(
                      children: [
                        _CategoryDot(
                          category: TodoCategory.work,
                          count: 2,
                        ),
                        const SizedBox(width: 8),
                        _CategoryDot(
                          category: TodoCategory.personal,
                          count: 1,
                        ),
                        const SizedBox(width: 8),
                        _CategoryDot(
                          category: TodoCategory.family,
                          count: 1,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                LinearProgressIndicator(
                  value: 0.5,
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  color: Theme.of(context).colorScheme.primary,
                  borderRadius: BorderRadius.circular(2),
                ),
                const SizedBox(height: 16),
                // Todo list
                ...List.generate(
                  4,
                  (index) => _TodoItem(
                    title: _getDummyTodoTitle(index),
                    category: TodoCategory.values[index % 3],
                    time: '${index + 1}:00 PM',
                    isCompleted: index < 2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _getDummyTodoTitle(int index) {
    final todos = [
      'Review project proposal',
      'Call with design team',
      'Family dinner reservation',
      'Prepare presentation',
    ];
    return todos[index];
  }
}

class _CategoryDot extends StatelessWidget {
  final TodoCategory category;
  final int count;

  const _CategoryDot({
    required this.category,
    required this.count,
  });

  Color _getCategoryColor(BuildContext context) {
    switch (category) {
      case TodoCategory.work:
        return Theme.of(context).colorScheme.primary;
      case TodoCategory.personal:
        return const Color(0xFF7C9A92); // Sage green
      case TodoCategory.family:
        return const Color(0xFFAD8B73); // Warm brown
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 6,
          height: 6,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _getCategoryColor(context),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          '$count',
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
          ),
        ),
      ],
    );
  }
}

class _TodoItem extends StatelessWidget {
  final String title;
  final TodoCategory category;
  final String time;
  final bool isCompleted;

  const _TodoItem({
    required this.title,
    required this.category,
    required this.time,
    required this.isCompleted,
  });

  Color _getCategoryColor(BuildContext context) {
    switch (category) {
      case TodoCategory.work:
        return Theme.of(context).colorScheme.primary;
      case TodoCategory.personal:
        return const Color(0xFF7C9A92); // Sage green
      case TodoCategory.family:
        return const Color(0xFFAD8B73); // Warm brown
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          // Checkbox
          SizedBox(
            width: 20,
            height: 20,
            child: Checkbox(
              value: isCompleted,
              onChanged: (value) {
                // TODO: Implement state management
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              side: BorderSide(
                color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Category indicator
          Container(
            width: 3,
            height: 16,
            decoration: BoxDecoration(
              color: _getCategoryColor(context),
              borderRadius: BorderRadius.circular(1.5),
            ),
          ),
          const SizedBox(width: 12),
          // Title and time
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      decoration: isCompleted ? TextDecoration.lineThrough : null,
                      color: isCompleted 
                          ? Theme.of(context).colorScheme.outline
                          : Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  time,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.outline,
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