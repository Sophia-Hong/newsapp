import 'package:flutter/material.dart';

class HistoryTimelineWidget extends StatelessWidget {
  const HistoryTimelineWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today in History',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to history detail page
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.only(bottom: 24),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _dummyHistory.length,
            itemBuilder: (context, index) {
              final history = _dummyHistory[index];
              return _HistoryCard(history: history);
            },
          ),
        ],
      ),
    );
  }
}

class _HistoryCard extends StatelessWidget {
  final HistoryInfo history;

  const _HistoryCard({required this.history});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        child: InkWell(
          onTap: () {
            // TODO: Navigate to history detail
          },
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(history.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        history.year.toString(),
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        history.title,
                        style: Theme.of(context).textTheme.titleMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        history.description,
                        style: Theme.of(context).textTheme.bodyMedium,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
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

class HistoryInfo {
  final int year;
  final String title;
  final String description;
  final String imageUrl;

  const HistoryInfo({
    required this.year,
    required this.title,
    required this.description,
    required this.imageUrl,
  });
}

final _dummyHistory = [
  HistoryInfo(
    year: 1895,
    title: 'First Film Screening',
    description: 'The Lumière brothers held the first public film screening.',
    imageUrl: 'https://picsum.photos/seed/history1/200',
  ),
  HistoryInfo(
    year: 1927,
    title: 'First Sound Film',
    description: 'The Jazz Singer debuts as the first feature-length sound film.',
    imageUrl: 'https://picsum.photos/seed/history2/200',
  ),
  HistoryInfo(
    year: 1937,
    title: 'First Animated Feature',
    description: 'Disney releases Snow White and the Seven Dwarfs.',
    imageUrl: 'https://picsum.photos/seed/history3/200',
  ),
]; 