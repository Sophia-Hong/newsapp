class NewsArticle {
  final String id;
  final String title;
  final String description;
  final String category;
  final String imageUrl;
  final DateTime publishedAt;
  final int readTime;

  const NewsArticle({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.imageUrl,
    required this.publishedAt,
    required this.readTime,
  });
}

enum NewsCategory {
  all,
  inspiration,
  culture,
  economy,
  politics;

  String get displayName {
    switch (this) {
      case NewsCategory.all:
        return 'All';
      case NewsCategory.inspiration:
        return 'Inspiration';
      case NewsCategory.culture:
        return 'Culture';
      case NewsCategory.economy:
        return 'Economy';
      case NewsCategory.politics:
        return 'Politics';
    }
  }
} 