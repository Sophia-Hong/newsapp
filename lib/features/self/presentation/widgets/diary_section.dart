import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';

class DiarySection extends StatelessWidget {
  const DiarySection({super.key});

  String _getRandomPrompt() {
    const prompts = [
      "✨ What made you feel alive today?",
      "🌱 Which small step moved you forward?",
      "💡 What new idea sparked your curiosity?",
      "🎯 What are you determined to learn next?",
      "🌟 What unexpected discovery brightened your day?",
      "💪 Which challenge helped you grow?",
      "🤝 Who inspired you today and why?",
      "🎨 What creative solution did you find?",
    ];
    // For now, return a fixed prompt. Later we can randomize
    return prompts[0];
  }

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
            'My Today',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(DesignSystem.spacing3),
          decoration: DesignSystem.cardDecoration(context),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(DesignSystem.spacing3),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.lightbulb_outline,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                    DesignSystem.hSpacing2,
                    Expanded(
                      child: Text(
                        _getRandomPrompt(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                          height: 1.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              DesignSystem.vSpacing3,
              TextField(
                maxLines: 5,
                decoration: InputDecoration(
                  hintText: 'Say or Write whatever you want here...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.all(DesignSystem.spacing3),
                ),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  height: 1.5,
                ),
              ),
              DesignSystem.vSpacing3,
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.image_outlined,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ),
                    onPressed: () {
                      // TODO: Implement image attachment
                    },
                    tooltip: 'Add image',
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.mic_none_rounded,
                      color: Theme.of(context).colorScheme.primary.withOpacity(0.7),
                    ),
                    onPressed: () {
                      // TODO: Implement voice note
                    },
                    tooltip: 'Add voice note',
                  ),
                  const Spacer(),
                  FilledButton.icon(
                    onPressed: () {
                      // TODO: Save reflection
                    },
                    icon: const Icon(Icons.check_rounded, size: 18),
                    label: const Text('Save'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
} 