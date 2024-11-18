import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/widgets/main_bottom_navigation_bar.dart';

final currentIndexProvider = StateProvider<int>((ref) => 0);

class ShellScreen extends ConsumerWidget {
  final Widget child;

  const ShellScreen({
    super.key,
    required this.child,
  });

  void _onTap(BuildContext context, WidgetRef ref, int index) {
    ref.read(currentIndexProvider.notifier).state = index;
    
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
        context.go('/connect');
        break;
      case 4:
        context.go('/my');
        break;
    }
  }

  int _getSelectedIndex(String location) {
    switch (location) {
      case '/':
        return 0;
      case '/news':
        return 1;
      case '/self':
        return 2;
      case '/connect':
        return 3;
      case '/my':
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String location = GoRouterState.of(context).uri.path;
    final currentIndex = _getSelectedIndex(location);
    
    // Update the provider state to match the current location
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(currentIndexProvider.notifier).state = currentIndex;
    });

    return Scaffold(
      body: child,
      bottomNavigationBar: MainBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTap(context, ref, index),
      ),
    );
  }
} 