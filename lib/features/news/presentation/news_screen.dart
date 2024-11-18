import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/news/domain/news_model.dart';
import 'package:newsapp/features/news/presentation/widgets/news_search_bar.dart';
import 'package:newsapp/features/news/presentation/widgets/category_chips.dart';
import 'package:newsapp/features/news/presentation/widgets/news_list.dart';

class NewsScreen extends ConsumerWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar with adjusted padding
            SliverPadding(
              padding: const EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing3,
              ),
              sliver: SliverAppBar(
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
            ),
            
            // Search Bar with adjusted padding and position
            SliverPadding(
              padding: const EdgeInsets.only(
                left: DesignSystem.spacing3,
                right: DesignSystem.spacing3,
                bottom: DesignSystem.spacing3,
              ),
              sliver: const SliverToBoxAdapter(
                child: NewsSearchBar(),
              ),
            ),

            // Category Chips with adjusted padding
            SliverPadding(
              padding: const EdgeInsets.only(
                bottom: DesignSystem.spacing3,
              ),
              sliver: SliverToBoxAdapter(
                child: CategoryChips(
                  categories: NewsCategory.values,
                  onCategorySelected: (category) {
                    // Category filtering is handled by the NewsList widget
                  },
                ),
              ),
            ),

            // News List with adjusted padding
            const SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: DesignSystem.spacing3,
              ),
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