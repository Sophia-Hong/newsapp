import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:newsapp/features/news/data/dummy_personal_history.dart';
import 'package:newsapp/features/news/domain/personal_history_model.dart';

class PersonalHistoryNews extends StatelessWidget {
  const PersonalHistoryNews({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: dummyPersonalHistory.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.only(bottom: DesignSystem.spacing2),
        child: _HistoryCard(
          entry: dummyPersonalHistory[index],
        ),
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final PersonalHistoryEntry entry;

  const _HistoryCard({
    required this.entry,
  });

  String _getTimeAgo() {
    final years = DateTime.now().difference(entry.originalDate).inDays ~/ 365;
    return '$years ${years == 1 ? 'Year' : 'Years'} Ago';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: DesignSystem.cardDecoration(context),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to history detail
          },
          borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(DesignSystem.radiusMedium),
                ),
                child: SizedBox(
                  width: 100,
                  height: 120,
                  child: CachedNetworkImage(
                    imageUrl: entry.imageUrl,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      color: Theme.of(context).colorScheme.surface,
                      child: Icon(
                        Icons.image_not_supported_outlined,
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.4),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(DesignSystem.spacing2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: DesignSystem.spacing2,
                          vertical: DesignSystem.spacing1,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                        ),
                        child: Text(
                          _getTimeAgo(),
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      DesignSystem.vSpacing1,
                      Text(
                        entry.title,
                        style: Theme.of(context).textTheme.titleSmall,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      DesignSystem.vSpacing1,
                      Text(
                        entry.description,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 