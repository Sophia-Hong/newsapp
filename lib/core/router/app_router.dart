import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/home/presentation/home_screen.dart';
import 'package:newsapp/features/news/presentation/news_screen.dart';
import 'package:newsapp/features/self/presentation/self_screen.dart';
import 'package:newsapp/features/connect/presentation/connect_screen.dart';
import 'package:newsapp/features/my/presentation/my_screen.dart';
import 'package:newsapp/core/widgets/shell_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      ShellRoute(
        builder: (context, state, child) => ShellScreen(child: child),
        routes: [
          GoRoute(
            path: '/',
            name: 'home',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/news',
            name: 'news',
            builder: (context, state) => const NewsScreen(),
          ),
          GoRoute(
            path: '/self',
            name: 'self',
            builder: (context, state) => const SelfScreen(),
          ),
          GoRoute(
            path: '/connect',
            name: 'connect',
            builder: (context, state) => const ConnectScreen(),
          ),
          GoRoute(
            path: '/my',
            name: 'my',
            builder: (context, state) => const MyScreen(),
          ),
        ],
      ),
    ],
  );
}); 