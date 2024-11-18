import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/connect/presentation/widgets/like_minded_section.dart';
import 'package:newsapp/features/connect/presentation/widgets/keyword_community_section.dart';

class ConnectScreen extends ConsumerWidget {
  const ConnectScreen({super.key});

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
                'Connect',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
              pinned: true,
            ),

            // Like-minded Section
            const SliverPadding(
              padding: EdgeInsets.only(bottom: DesignSystem.spacing3),
              sliver: SliverToBoxAdapter(
                child: LikeMindedSection(),
              ),
            ),

            // Keyword Community Section
            const SliverToBoxAdapter(
              child: KeywordCommunitySection(),
            ),

            // Bottom spacing
            const SliverPadding(
              padding: EdgeInsets.only(bottom: DesignSystem.spacing4),
            ),
          ],
        ),
      ),
    );
  }
} 