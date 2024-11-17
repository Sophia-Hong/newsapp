import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/constants/app_constants.dart';
import 'package:newsapp/core/widgets/main_bottom_navigation_bar.dart';
import 'package:newsapp/features/home/presentation/home_screen.dart';
import 'package:newsapp/features/splash/splash_screen.dart';
import 'package:newsapp/features/weather/presentation/weather_screen.dart';
import 'package:newsapp/features/profile/presentation/profile_screen.dart';
import 'package:newsapp/features/news/presentation/news_detail_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: AppConstants.splash,
    routes: [
      GoRoute(
        path: AppConstants.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return ScaffoldWithBottomNavBar(child: child);
        },
        routes: [
          GoRoute(
            path: AppConstants.home,
            pageBuilder: (context, state) => NoTransitionPage(
              child: const HomeScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.weather,
            pageBuilder: (context, state) => NoTransitionPage(
              child: const WeatherScreen(),
            ),
          ),
          GoRoute(
            path: AppConstants.profile,
            pageBuilder: (context, state) => NoTransitionPage(
              child: const ProfileScreen(),
            ),
          ),
        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: '/news/:id',
        builder: (context, state) {
          final newsId = state.pathParameters['id']!;
          return NewsDetailScreen(newsId: newsId);
        },
      ),
    ],
  );
});

class ScaffoldWithBottomNavBar extends ConsumerWidget {
  final Widget child;

  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const MainBottomNavigationBar(),
    );
  }
} 