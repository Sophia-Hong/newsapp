import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.location_on, size: 16),
                const SizedBox(width: 4),
                Text(
                  'Temecula',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const Spacer(),
                Text(
                  'Updated 5 min ago',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '72°F',
                      style: Theme.of(context).textTheme.displayMedium,
                    ),
                    Text(
                      'Feels like 75°F',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const Icon(Icons.wb_sunny, size: 64),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _WeatherInfo(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '65%',
                ),
                _WeatherInfo(
                  icon: Icons.umbrella,
                  label: 'Rain',
                  value: '10%',
                ),
                _WeatherInfo(
                  icon: Icons.air,
                  label: 'Wind',
                  value: '5 mph',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _WeatherInfo({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ],
    );
  }
} 