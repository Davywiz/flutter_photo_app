import 'package:flutter/material.dart';
import 'package:flutter_photo_app/utils/state_logger.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'app/app.dart';

void main() {
  runApp(
    const ProviderScope(
      observers: [StateLogger()],
      child: MyApp(),
    ),
  );
}
