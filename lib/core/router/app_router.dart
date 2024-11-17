import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/constants/app_constants.dart';
import 'package:newsapp/core/widgets/main_bottom_navigation_bar.dart';
import 'package:newsapp/features/home/presentation/home_screen.dart';
import 'package:newsapp/features/weather/presentation/weather_screen.dart';
import 'package:newsapp/features/profile/presentation/profile_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppConstants.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: AppConstants.home,
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: AppConstants.weather,
            builder: (context, state) => const WeatherScreen(),
          ),
          GoRoute(
            path: AppConstants.profile,
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
  );
});

class ScaffoldWithBottomNavBar extends StatelessWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
} 