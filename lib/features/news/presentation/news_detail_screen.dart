import 'package:flutter/material.dart';

class NewsDetailScreen extends StatelessWidget {
  final String newsId;

  const NewsDetailScreen({
    super.key,
    required this.newsId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Detail'),
      ),
      body: Center(
        child: Text('News Detail Screen: $newsId'),
      ),
    );
  }
} 