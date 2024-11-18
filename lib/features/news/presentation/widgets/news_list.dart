import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/news/data/dummy_news.dart';
import 'package:newsapp/features/news/domain/news_model.dart';
import 'package:newsapp/features/news/presentation/widgets/news_card.dart';
import 'package:newsapp/features/news/presentation/widgets/category_chips.dart';

class NewsList extends ConsumerWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    
    final filteredNews = dummyNews.where((article) {
      if (selectedCategory == NewsCategory.all) return true;
      return article.category.toLowerCase() == selectedCategory.displayName.toLowerCase();
    }).toList();

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          if (index >= filteredNews.length) return null;
          return Padding(
            padding: const EdgeInsets.only(bottom: DesignSystem.spacing3),
            child: NewsCard(article: filteredNews[index]),
          );
        },
      ),
    );
  }
} 