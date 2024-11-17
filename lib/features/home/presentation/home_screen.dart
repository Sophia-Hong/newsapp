import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/features/home/widgets/news_card_swiper.dart';
import 'package:newsapp/features/home/widgets/weather_widget.dart';
import 'package:newsapp/features/home/widgets/stock_ticker.dart';
import 'package:newsapp/features/home/widgets/history_timeline.dart';
import 'package:newsapp/core/widgets/paper_background.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PaperBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SOPHIE',
                style: GoogleFonts.playfairDisplay(
                  textStyle: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    letterSpacing: 3,
                    fontSize: 28,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  width: 1.5,
                  height: 28,
                  color: Theme.of(context).colorScheme.secondary.withOpacity(0.3),
                ),
              ),
              Text(
                'today',
                style: GoogleFonts.libreBaskerville(
                  textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 0.5,
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.secondary.withOpacity(0.8),
                  ),
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                color: Theme.of(context).colorScheme.primary,
              ),
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
      ),
    );
  }
} 