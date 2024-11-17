import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/constants/app_constants.dart';
import 'package:newsapp/core/providers/navigation_provider.dart';

class MainBottomNavigationBar extends ConsumerWidget {
  const MainBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentIndex = ref.watch(navigationIndexProvider);

    return NavigationBar(
      selectedIndex: currentIndex,
      onDestinationSelected: (index) {
        ref.read(navigationIndexProvider.notifier).state = index;
        switch (index) {
          case 0:
            context.go(AppConstants.home);
            break;
          case 1:
            context.go(AppConstants.weather);
            break;
          case 2:
            context.go(AppConstants.profile);
            break;
        }
      },
      destinations: const [
        NavigationDestination(
          icon: Icon(Icons.home_outlined),
          selectedIcon: Icon(Icons.home),
          label: '뉴스',
        ),
        NavigationDestination(
          icon: Icon(Icons.cloud_outlined),
          selectedIcon: Icon(Icons.cloud),
          label: '날씨',
        ),
        NavigationDestination(
          icon: Icon(Icons.person_outline),
          selectedIcon: Icon(Icons.person),
          label: 'My',
        ),
      ],
    );
  }
} 