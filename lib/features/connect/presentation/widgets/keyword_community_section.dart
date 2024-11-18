import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/connect/data/dummy_connect_data.dart';
import 'package:newsapp/features/connect/domain/connect_model.dart';

class KeywordCommunitySection extends StatelessWidget {
  const KeywordCommunitySection({super.key});

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
            'Keyword Communities',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: dummyKeywordCommunities.length,
          itemBuilder: (context, index) => _CommunityCard(
            community: dummyKeywordCommunities[index],
          ),
        ),
      ],
    );
  }
}

class _CommunityCard extends StatelessWidget {
  final KeywordCommunity community;

  const _CommunityCard({
    required this.community,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        left: DesignSystem.spacing3,
        right: DesignSystem.spacing3,
        bottom: DesignSystem.spacing2,
      ),
      decoration: DesignSystem.cardDecoration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to community detail
          },
          borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
          child: Padding(
            padding: const EdgeInsets.all(DesignSystem.spacing3),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(DesignSystem.spacing2),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                      ),
                      child: Icon(
                        community.icon,
                        color: Theme.of(context).colorScheme.primary,
                        size: 20,
                      ),
                    ),
                    DesignSystem.hSpacing2,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            community.keyword,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Text(
                            '${community.memberCount} members',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        // TODO: Join/Leave community
                      },
                      style: FilledButton.styleFrom(
                        backgroundColor: community.isJoined
                            ? Theme.of(context).colorScheme.primary.withOpacity(0.1)
                            : Theme.of(context).colorScheme.primary,
                        foregroundColor: community.isJoined
                            ? Theme.of(context).colorScheme.primary
                            : Colors.white,
                      ),
                      child: Text(community.isJoined ? 'Joined' : 'Join'),
                    ),
                  ],
                ),
                if (community.recentTopics.isNotEmpty) ...[
                  DesignSystem.vSpacing3,
                  Wrap(
                    spacing: DesignSystem.spacing2,
                    runSpacing: DesignSystem.spacing1,
                    children: community.recentTopics.map((topic) => Chip(
                      label: Text(
                        topic,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.8),
                        ),
                      ),
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
                      ),
                    )).toList(),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
} 