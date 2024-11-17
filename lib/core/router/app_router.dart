import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/providers/navigation_provider.dart';
import 'package:newsapp/core/widgets/main_bottom_navigation_bar.dart';
import 'package:newsapp/features/home/presentation/home_screen.dart';
import 'package:newsapp/features/news/presentation/news_screen.dart';
import 'package:newsapp/features/self/presentation/self_screen.dart';
import 'package:newsapp/features/my/presentation/my_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final navigationState = ref.watch(navigationProvider);

  return GoRouter(
    initialLocation: '/',
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return ScaffoldWithBottomNavBar(
            currentIndex: navigationState,
            child: navigationShell,
          );
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/',
                builder: (context, state) => const HomeScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/news',
                builder: (context, state) => const NewsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/self',
                builder: (context, state) => const SelfScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/my',
                builder: (context, state) => const MyScreen(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

class ScaffoldWithBottomNavBar extends ConsumerWidget {
  final Widget child;
  final int currentIndex;

  const ScaffoldWithBottomNavBar({
    super.key,
    required this.child,
    required this.currentIndex,
  });

  void _onTap(BuildContext context, WidgetRef ref, int index) {
    ref.read(navigationProvider.notifier).setIndex(index);
    
    switch (index) {
      case 0:
        context.go('/');
        break;
      case 1:
        context.go('/news');
        break;
      case 2:
        context.go('/self');
        break;
      case 3:
        context.go('/my');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: child,
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(context, ref, index),
      ),
    );
  }
} 