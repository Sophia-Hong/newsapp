import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/core/constants/app_constants.dart';
import 'package:newsapp/core/router/app_router.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);

final navigationProvider = Provider<void>((ref) {
  final index = ref.watch(navigationIndexProvider);
  final router = ref.watch(routerProvider);

  switch (index) {
    case 0:
      router.go(AppConstants.home);
      break;
    case 1:
      router.go(AppConstants.weather);
      break;
    case 2:
      router.go(AppConstants.profile);
      break;
  }
}); 