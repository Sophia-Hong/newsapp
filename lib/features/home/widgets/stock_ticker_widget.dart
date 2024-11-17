import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StockTickerWidget extends ConsumerWidget {
  const StockTickerWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Watchlist',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Navigate to stock detail page
                  },
                  child: const Text('See All'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: _dummyStocks.length,
              itemBuilder: (context, index) {
                final stock = _dummyStocks[index];
                return _StockCard(stock: stock);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _StockCard extends StatelessWidget {
  final StockInfo stock;

  const _StockCard({required this.stock});

  @override
  Widget build(BuildContext context) {
    final isPositive = stock.changePercent > 0;
    final changeColor = isPositive ? Colors.green : Colors.red;

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              stock.symbol,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              stock.name,
              style: Theme.of(context).textTheme.bodySmall,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Spacer(),
            Text(
              '\$${stock.price.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Icon(
                  isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                  size: 16,
                  color: changeColor,
                ),
                Text(
                  '${isPositive ? '+' : ''}${stock.changePercent.toStringAsFixed(2)}%',
                  style: TextStyle(
                    color: changeColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StockInfo {
  final String symbol;
  final String name;
  final double price;
  final double changePercent;

  const StockInfo({
    required this.symbol,
    required this.name,
    required this.price,
    required this.changePercent,
  });
}

final _dummyStocks = [
  StockInfo(
    symbol: 'AAPL',
    name: 'Apple Inc.',
    price: 173.50,
    changePercent: 1.23,
  ),
  StockInfo(
    symbol: 'GOOGL',
    name: 'Alphabet Inc.',
    price: 141.80,
    changePercent: -0.45,
  ),
  StockInfo(
    symbol: 'MSFT',
    name: 'Microsoft Corporation',
    price: 378.92,
    changePercent: 2.15,
  ),
  StockInfo(
    symbol: 'AMZN',
    name: 'Amazon.com Inc.',
    price: 178.35,
    changePercent: -1.08,
  ),
  StockInfo(
    symbol: 'TSLA',
    name: 'Tesla, Inc.',
    price: 205.66,
    changePercent: 3.45,
  ),
]; 