import 'package:flutter/material.dart';

class StockTicker extends StatelessWidget {
  const StockTicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: _StockCard(index: index),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _StockCard extends StatelessWidget {
  final int index;

  const _StockCard({required this.index});

  @override
  Widget build(BuildContext context) {
    final isPositive = index % 2 == 0;
    
    return SizedBox(
      width: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AAPL',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 4),
          Text(
            '\$150.${index}0',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: isPositive ? Colors.green : Colors.red,
              ),
              const SizedBox(width: 4),
              Text(
                '${isPositive ? '+' : '-'}2.${index}%',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isPositive ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
} 