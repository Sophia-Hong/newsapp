import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/self/presentation/widgets/word_cloud_section.dart';
import 'package:newsapp/features/self/presentation/widgets/diary_section.dart';
import 'package:newsapp/features/self/presentation/widgets/learning_journey_section.dart';

class SelfScreen extends ConsumerWidget {
  const SelfScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              backgroundColor: Theme.of(context).colorScheme.background,
              title: Text(
                'Where I am',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              pinned: true,
            ),

            // Word Cloud Section
            const SliverPadding(
              padding: EdgeInsets.all(DesignSystem.spacing3),
              sliver: SliverToBoxAdapter(
                child: WordCloudSection(),
              ),
            ),

            // Diary Section
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing3,
                vertical: DesignSystem.spacing2,
              ),
              sliver: SliverToBoxAdapter(
                child: DiarySection(),
              ),
            ),

            // Learning Journey Section
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing3,
                vertical: DesignSystem.spacing2,
              ),
              sliver: SliverToBoxAdapter(
                child: LearningJourneySection(),
              ),
            ),

            // More sections to come...
          ],
        ),
      ),
    );
  }
} 