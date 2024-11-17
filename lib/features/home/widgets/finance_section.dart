import 'package:flutter/material.dart';

enum InvestmentType {
  stock,
  realEstate,
  crypto,
  savings,
}

class FinanceSection extends StatelessWidget {
  const FinanceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Portfolio Overview
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Total Portfolio',
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '\$284,521.00',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_upward,
                        size: 14,
                        color: Colors.green[700],
                      ),
                      const SizedBox(width: 4),
                      Text(
                        '2.4%',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Investment Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: InvestmentType.values.map((type) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: _InvestmentCard(type: type),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InvestmentCard extends StatelessWidget {
  final InvestmentType type;

  const _InvestmentCard({required this.type});

  String get _title {
    switch (type) {
      case InvestmentType.stock:
        return 'AAPL';
      case InvestmentType.realEstate:
        return 'LA Property';
      case InvestmentType.crypto:
        return 'Bitcoin';
      case InvestmentType.savings:
        return 'High Yield';
    }
  }

  String get _value {
    switch (type) {
      case InvestmentType.stock:
        return '\$182.52';
      case InvestmentType.realEstate:
        return '\$850K';
      case InvestmentType.crypto:
        return '\$43,210';
      case InvestmentType.savings:
        return '\$52,430';
    }
  }

  String get _change {
    switch (type) {
      case InvestmentType.stock:
        return '+1.2%';
      case InvestmentType.realEstate:
        return '+5.3%';
      case InvestmentType.crypto:
        return '-2.1%';
      case InvestmentType.savings:
        return '+0.3%';
    }
  }

  IconData get _icon {
    switch (type) {
      case InvestmentType.stock:
        return Icons.show_chart;
      case InvestmentType.realEstate:
        return Icons.home_work;
      case InvestmentType.crypto:
        return Icons.currency_bitcoin;
      case InvestmentType.savings:
        return Icons.savings;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPositive = _change.startsWith('+');
    
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                _icon,
                size: 16,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(width: 6),
              Text(
                _title,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            _value,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _change,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: isPositive ? Colors.green[700] : Colors.red[700],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
} 