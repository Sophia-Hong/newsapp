import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/connect/data/dummy_connect_data.dart';
import 'package:newsapp/features/connect/domain/connect_model.dart';

class LikeMindedSection extends StatelessWidget {
  const LikeMindedSection({super.key});

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
            'Like-minded People',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: DesignSystem.spacing2),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spacing3),
            itemCount: dummyLikeMindedProfiles.length,
            itemBuilder: (context, index) => _PersonCard(
              profile: dummyLikeMindedProfiles[index],
            ),
          ),
        ),
      ],
    );
  }
}

class _PersonCard extends StatelessWidget {
  final LikeMindedProfile profile;

  const _PersonCard({
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: DesignSystem.spacing3),
      decoration: DesignSystem.cardDecoration,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(profile.imageUrl!),
            backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          DesignSystem.vSpacing2,
          Text(
            profile.name,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          DesignSystem.vSpacing1,
          Text(
            'Match: ${(profile.matchScore * 100).toInt()}%',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
} 