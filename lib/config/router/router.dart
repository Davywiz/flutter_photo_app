import 'package:flutter_photo_app/presentation/images_grid/images_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'router_notifier.dart';

/// This simple provider caches our GoRouter.
final routerProvider = Provider.autoDispose<GoRouter>((ref) {
  final notifier = ref.watch(routerNotifierProvider.notifier);

  return GoRouter(
    navigatorKey: notifier.globalKey,
    refreshListenable: notifier,
    debugLogDiagnostics: true,
    initialLocation: GridImageScreen.routeLocation,
    routes: notifier.routes,
  );
});
