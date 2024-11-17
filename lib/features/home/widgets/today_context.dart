import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

enum TimelineType {
  personal,
  world,
  futureMessage,
}

class TodayContext extends StatelessWidget {
  const TodayContext({super.key});

  @override
  Widget build(BuildContext context) {
    final today = DateTime.now();
    final dateFormat = DateFormat('MMM d');

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
            // Date context with add button
            Row(
              children: [
                Text(
                  dateFormat.format(today),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Spacer(),
                // Add future message button
                TextButton.icon(
                  onPressed: () {
                    // TODO: Show dialog to add future message
                  },
                  icon: Icon(
                    Icons.edit_calendar_outlined,
                    size: 16,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  label: Text(
                    'Write to Future',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Timeline entries
            ...TimelineType.values.map((type) => _TimelineEntry(
              type: type,
              date: today,
            )),
          ],
        ),
      ),
    );
  }
}

class _TimelineEntry extends StatelessWidget {
  final TimelineType type;
  final DateTime date;

  const _TimelineEntry({
    required this.type,
    required this.date,
  });

  String get _getYear {
    switch (type) {
      case TimelineType.personal:
        return '2023';
      case TimelineType.world:
        return '1969';
      case TimelineType.futureMessage:
        return 'Message';
    }
  }

  String get _getTitle {
    switch (type) {
      case TimelineType.personal:
        return 'Started Learning Flutter';
      case TimelineType.world:
        return 'First Moon Landing';
      case TimelineType.futureMessage:
        return 'Launch My First App';
    }
  }

  String get _getDescription {
    switch (type) {
      case TimelineType.personal:
        return 'A year ago, took the first step into mobile development';
      case TimelineType.world:
        return '"One small step for man, one giant leap for mankind"';
      case TimelineType.futureMessage:
        return 'Dear future me, I hope you\'ve achieved this milestone. Remember why you started.';
    }
  }

  IconData get _getIcon {
    switch (type) {
      case TimelineType.personal:
        return Icons.history_edu;
      case TimelineType.world:
        return Icons.public;
      case TimelineType.futureMessage:
        return Icons.mail_outline;
    }
  }

  Color _getColor(BuildContext context) {
    switch (type) {
      case TimelineType.personal:
        return Theme.of(context).colorScheme.primary;
      case TimelineType.world:
        return const Color(0xFF7C9A92);
      case TimelineType.futureMessage:
        return const Color(0xFFB4838D);
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = _getColor(context);
    final isFutureMessageForToday = type == TimelineType.futureMessage && 
        // Add logic to check if this message was set for today
        true;
    
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // TODO: Show detail view or edit dialog
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: isFutureMessageForToday 
                ? color.withOpacity(0.1)
                : color.withOpacity(0.05),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isFutureMessageForToday
                  ? color.withOpacity(0.3)
                  : color.withOpacity(0.1),
            ),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  _getIcon,
                  size: 20,
                  color: color,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          _getYear,
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        if (type == TimelineType.futureMessage) ...[
                          const SizedBox(width: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: color.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              'Mar 15, 2025',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: color,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                        const SizedBox(width: 8),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: BoxDecoration(
                            color: color.withOpacity(0.5),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            _getTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      _getDescription,
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 