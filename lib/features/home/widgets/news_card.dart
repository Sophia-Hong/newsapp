import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

enum NewsCategory {
  inspiration,
  culture,
  economy,
  politics,
}

class NewsCard extends StatelessWidget {
  final int index;
  
  const NewsCard({
    super.key,
    required this.index,
  });

  NewsCategory get category => NewsCategory.values[index % 4];

  String get _getUnsplashImage {
    switch (category) {
      case NewsCategory.inspiration:
        // Light, ethereal beige waves
        return 'https://images.unsplash.com/photo-1508615070457-7baeba4003ab'; // Soft beige sand dunes
        // Alternatives if you prefer:
        // 'https://images.unsplash.com/photo-1509114397022-ed747cca3f65' // Light abstract waves
        // 'https://images.unsplash.com/photo-1601662528567-526cd06f6582' // Beige silk waves
      case NewsCategory.culture:
        // Cultural images
        return 'https://images.unsplash.com/photo-1518998053901-5348d3961a04'; // Art gallery
      case NewsCategory.economy:
        // Economic/business images
        return 'https://images.unsplash.com/photo-1486406146926-c627a92ad1ab'; // Modern architecture
      case NewsCategory.politics:
        // Political/journalism images
        return 'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f'; // Newspapers
    }
  }

  String get _getHeadline {
    switch (category) {
      case NewsCategory.inspiration:
        return 'The Space Between Thoughts: Finding Clarity in Simplicity';
      case NewsCategory.culture:
        return 'Contemporary Art Meets Traditional Korean Heritage';
      case NewsCategory.economy:
        return 'The Future of Sustainable Finance in Asia';
      case NewsCategory.politics:
        return 'Reshaping Global Cooperation: New Diplomatic Initiatives';
    }
  }

  String get _getSubheadline {
    switch (category) {
      case NewsCategory.inspiration:
        return 'Exploring how minimalism and mindful spaces shape our inner landscape';
      case NewsCategory.culture:
        return 'Exhibition explores the intersection of modern aesthetics and cultural preservation';
      case NewsCategory.economy:
        return 'Green bonds and sustainable investments reshape Asian markets';
      case NewsCategory.politics:
        return 'New framework for international collaboration emerges from recent summit';
    }
  }

  String get _getAuthor {
    switch (category) {
      case NewsCategory.inspiration:
        return 'Emma Park';
      case NewsCategory.culture:
        return 'Min-ji Kim';
      case NewsCategory.economy:
        return 'David Chen';
      case NewsCategory.politics:
        return 'Sophie Williams';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'news_$index',
      child: Material(
        child: InkWell(
          onTap: () {
            // We'll implement navigation later
          },
          borderRadius: BorderRadius.circular(16),
          child: Card(
            margin: EdgeInsets.zero,
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(16),
                      ),
                      child: AspectRatio(
                        aspectRatio: 16 / 9,
                        child: CachedNetworkImage(
                          imageUrl: '$_getUnsplashImage?w=800&q=85',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) => 
                              const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      left: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          category.name.toUpperCase(),
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 8,
                      right: 8,
                      child: IconButton(
                        icon: const Icon(Icons.bookmark_border),
                        onPressed: () {
                          // TODO: Implement bookmark functionality
                        },
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          foregroundColor: Colors.white,
                        ),
                        tooltip: 'Bookmark this article',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Author info
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundImage: NetworkImage(
                              'https://i.pravatar.cc/150?u=$index',
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            _getAuthor,
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            '• 2 hours ago',
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 18),
                      // Headline
                      Text(
                        _getHeadline,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 23,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Subheadline
                      Text(
                        _getSubheadline,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey[600],
                          fontSize: 16,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 24),
                      // Bottom row
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.auto_awesome,
                                  size: 14,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'AI summary',
                                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Theme.of(context).colorScheme.primary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 12),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(Icons.access_time, size: 16),
                              const SizedBox(width: 4),
                              Text(
                                '5 min read',
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.share, size: 18),
                            onPressed: () {
                              // TODO: Implement share functionality
                            },
                            visualDensity: VisualDensity.compact,
                            style: IconButton.styleFrom(
                              padding: const EdgeInsets.all(8),
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
} 