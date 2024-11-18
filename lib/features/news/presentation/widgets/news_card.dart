import 'package:flutter/material.dart';
import 'package:newsapp/core/theme/design_system.dart';
import 'package:newsapp/features/news/domain/news_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsCard extends StatelessWidget {
  final NewsArticle article;

  const NewsCard({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: DesignSystem.cardDecoration(context),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {
            // TODO: Navigate to article detail
          },
          borderRadius: BorderRadius.circular(DesignSystem.radiusMedium),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(DesignSystem.radiusMedium),
                ),
                child: SizedBox(
                  width: 120,
                  height: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl: article.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(DesignSystem.spacing3),
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
                          article.category,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      DesignSystem.vSpacing2,
                      Text(
                        article.title,
                        style: Theme.of(context).textTheme.titleSmall,
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