import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/news/domain/news_model.dart';
import 'package:newsapp/features/news/presentation/widgets/news_search_bar.dart';
import 'package:newsapp/features/news/presentation/widgets/category_chips.dart';
import 'package:newsapp/features/news/presentation/widgets/news_list.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              backgroundColor: Theme.of(context).colorScheme.background,
              leadingWidth: 40,
              leading: IconButton(
                icon: const Icon(Icons.chevron_left),
                onPressed: () => Navigator.pop(context),
              ),
              title: Text(
                'News for Sophie',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              centerTitle: true,
            ),
            
            // Search Bar
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing3,
                vertical: DesignSystem.spacing2,
              ),
              sliver: const SliverToBoxAdapter(
                child: NewsSearchBar(),
              ),
            ),

            // Category Chips
            SliverPadding(
              padding: const EdgeInsets.only(
                bottom: DesignSystem.spacing3,
              ),
              sliver: SliverToBoxAdapter(
                child: CategoryChips(
                  categories: NewsCategory.values,
                  onCategorySelected: (category) {
                    // Category filtering is now handled by the NewsList widget
                  },
                ),
              ),
            ),

            // News List
            const SliverPadding(
              padding: EdgeInsets.symmetric(horizontal: DesignSystem.spacing3),
              sliver: NewsList(),
            ),

            // Bottom padding for list
            const SliverPadding(
              padding: EdgeInsets.only(bottom: DesignSystem.spacing4),
            ),
          ],
        ),
      ),
    );
  }
} 