import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/features/home/widgets/news_card_swiper.dart';
import 'package:newsapp/features/home/widgets/weather_widget.dart';
import 'package:newsapp/features/home/widgets/finance_section.dart';
import 'package:newsapp/features/home/widgets/time_capsule.dart';
import 'package:newsapp/core/widgets/paper_background.dart';
import 'package:newsapp/features/home/widgets/todo_section.dart';
import 'package:newsapp/features/home/widgets/growth_space.dart';
import 'package:newsapp/features/home/widgets/health_tracker.dart';
import 'package:newsapp/features/home/widgets/daily_callout.dart';

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
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            // TODO: Implement refresh
          },
          child: CustomScrollView(
            slivers: [
              // Daily Callout Section
              const SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: DailyCallout(),
                ),
              ),

              // News Card Swiper Section
              const SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverToBoxAdapter(
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

              // Todo Section
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: TodoSection(),
                ),
              ),

              // Health Tracker Section
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Health',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      const HealthTracker(),
                    ],
                  ),
                ),
              ),

              // Finance Section
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Finance',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      const FinanceSection(),
                    ],
                  ),
                ),
              ),

              // Growth Space Section
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Growth Space',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      const GrowthSpace(),
                    ],
                  ),
                ),
              ),

              // Time Capsule Section
              SliverPadding(
                padding: const EdgeInsets.all(16.0),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Time Capsule',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(height: 8),
                      const TimeCapsule(),
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