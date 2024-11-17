import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:newsapp/core/constants/app_constants.dart';
import 'package:newsapp/core/router/app_router.dart';

final navigationIndexProvider = StateProvider<int>((ref) => 0);

final navigationProvider = Provider<void>((ref) {
  ref.listen<int>(navigationIndexProvider, (previous, next) {
    switch (next) {
      case 0:
        ref.read(routerProvider).go(AppConstants.home);
        break;
      case 1:
        ref.read(routerProvider).go(AppConstants.weather);
        break;
      case 2:
        ref.read(routerProvider).go(AppConstants.profile);
        break;
    }
  });
}); 