import 'package:flutter/material.dart';

class DailyCallout extends StatelessWidget {
  const DailyCallout({super.key});

  String _getCalloutMessage() {
    // TODO: Will be replaced with actual time capsule message
    return "Today is my youngest day.";
  }

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.lightbulb_outline,
              size: 20,
              color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                _getCalloutMessage(),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontStyle: FontStyle.italic,
                  height: 1.4,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 