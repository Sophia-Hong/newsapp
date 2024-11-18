import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:cached_network_image/cached_network_image.dart';

class WordCloudSection extends StatelessWidget {
  const WordCloudSection({super.key});

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
            'My Current Keywords',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          decoration: DesignSystem.cardDecoration,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
            child: CachedNetworkImage(
              imageUrl: 'https://i.pinimg.com/736x/b4/eb/36/b4eb3603c3871bb5bce03b8535b19b96.jpg',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                color: Theme.of(context).colorScheme.surface,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              errorWidget: (context, url, error) => Container(
                color: Theme.of(context).colorScheme.surface,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Theme.of(context).colorScheme.error,
                      ),
                      DesignSystem.vSpacing2,
                      Text(
                        'Failed to load word cloud',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
} 