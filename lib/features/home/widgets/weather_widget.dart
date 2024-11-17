import 'package:flutter/material.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Temecula',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Updated 5m ago',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const Icon(
                      Icons.wb_sunny,
                      size: 64,
                      color: Colors.orange,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '72°',
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'Sunny',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                        Text(
                          'Feels like 75°',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildWeatherInfo(
                      context,
                      Icons.water_drop,
                      '65%',
                      'Humidity',
                    ),
                    _buildWeatherInfo(
                      context,
                      Icons.umbrella,
                      '10%',
                      'Rain',
                    ),
                    _buildWeatherInfo(
                      context,
                      Icons.air,
                      '8mph',
                      'Wind',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWeatherInfo(
    BuildContext context,
    IconData icon,
    String value,
    String label,
  ) {
    return Column(
      children: [
        Icon(icon, size: 24),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ],
    );
  }
} 