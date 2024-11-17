import 'package:flutter/material.dart';
import 'package:newsapp/features/home/widgets/news_card_swiper.dart';
import 'package:newsapp/features/home/widgets/weather_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your News',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement search
            },
          ),
        ],
      ),
      body: const CustomScrollView(
        slivers: [
          NewsCardSwiper(),
          WeatherWidget(),
          // TODO: Implement stock widget
          // TODO: Implement history section
        ],
      ),
    );
  }
} 