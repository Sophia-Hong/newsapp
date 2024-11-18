import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/news/domain/news_model.dart';

// State provider for selected category
final selectedCategoryProvider = StateProvider<NewsCategory>((ref) => NewsCategory.all);

class CategoryChips extends ConsumerWidget {
  final List<NewsCategory> categories;
  final Function(NewsCategory) onCategorySelected;

  const CategoryChips({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: DesignSystem.spacing3),
      child: Row(
        children: categories.map((category) {
          final isSelected = category == selectedCategory;
          return Padding(
            padding: const EdgeInsets.only(right: DesignSystem.spacing2),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () {
                  ref.read(selectedCategoryProvider.notifier).state = category;
                  onCategorySelected(category);
                },
                borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: DesignSystem.spacing3,
                    vertical: DesignSystem.spacing2,
                  ),
                  decoration: BoxDecoration(
                    color: isSelected 
                        ? Theme.of(context).colorScheme.surface
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(DesignSystem.radiusSmall),
                    border: Border.all(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.outline.withOpacity(0.1),
                    ),
                  ),
                  child: Text(
                    category.displayName,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isSelected
                          ? Theme.of(context).colorScheme.primary
                          : Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
} 