import 'package:flutter/material.dart';
import 'package:newsapp/features/home/widgets/news_card_swiper.dart';
import 'package:newsapp/features/home/widgets/weather_widget.dart';
import 'package:newsapp/features/home/widgets/stock_ticker.dart';
import 'package:newsapp/features/home/widgets/history_timeline.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your News',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontFamily: 'NewYork',
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
            tooltip: 'Search news',
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          // TODO: Implement refresh
        },
        child: CustomScrollView(
          slivers: [
            // News Card Swiper Section
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: NewsCardSwiper(),
              ),
            ),
            
            // Weather Widget Section
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Weather',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const WeatherWidget(),
                  ],
                ),
              ),
            ),

            // Stock Ticker Section
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Market',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const StockTicker(),
                  ],
                ),
              ),
            ),

            // History Timeline Section
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Today in History',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 8),
                    const HistoryTimeline(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 