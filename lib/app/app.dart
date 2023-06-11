import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../config/router/router.dart';
import '../config/string_manager/app_strings.dart';
import '../config/theme_manager/theme_manager.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: AppStrings.appName,
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
    );
  }
}
