import 'package:flutter/material.dart';
import 'package:flutter_photo_app/models/image_model.dart';
import 'package:flutter_photo_app/presentation/image_detail/image_details.dart';
import 'package:flutter_photo_app/presentation/images_grid/images_grid.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// This notifier is meant to implement the [Listenable] our [GoRouter] needs.
/// We aim to trigger redirects whenever's needed.
/// This is done by calling our (only) listener every time we want to notify stuff.
/// This allows to centralize global redirecting logic in this class.
/// In this simple case, we just listen to auth changes.

final _key = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1, 0),
            end: Offset.zero,
          ).animate(animation),
          child: child);
    },
  );
}

class RouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;
  bool isAuth = false; // Useful for our global redirect function

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      // conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  GlobalKey<NavigatorState> get globalKey => _key;

  /// Our application routes
  List<RouteBase> get routes => [
        GoRoute(
          path: GridImageScreen.routeLocation,
          name: GridImageScreen.routeName,
          builder: (context, state) => const GridImageScreen(),
          routes: [
            GoRoute(
              path: ImageDetailScreen.routeLocation,
              name: ImageDetailScreen.routeName,
              pageBuilder: (context, state) =>
                  buildPageWithDefaultTransition<void>(
                context: context,
                state: state,
                child: ImageDetailScreen(
                  imageModel: state.extra as ImageModel,
                ),
              ),
            ),
          ],
        ),
      ];

  /// Adds [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method on creation to handle its
  /// internal [ChangeNotifier].
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  /// Removes [GoRouter]'s listener as specified by its [Listenable].
  /// [GoRouteInformationProvider] uses this method when disposing,
  /// so that it removes its callback when destroyed.
  /// Check out the internal implementation of [GoRouter] and
  /// [GoRouteInformationProvider] to see this in action.
  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

final routerNotifierProvider =
    AutoDisposeAsyncNotifierProvider<RouterNotifier, void>(() {
  return RouterNotifier();
});
