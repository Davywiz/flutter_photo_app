import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../config/color_manager/color_manager.dart';

class LoadingOverlayWidget extends StatelessWidget {
  const LoadingOverlayWidget({super.key, this.text});

  final String? text;

  @override
  Widget build(BuildContext context) => Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SpinKitSquareCircle(
                color: AppColors.primaryColor,
              ),
            ),
            if (text != null) ...[
              const SizedBox(height: 12),
              Text(
                text!,
                style: TextStyle(
                  fontSize: 14,
                  color: AppColors.darkColor,
                ),
              ),
            ]
          ],
        ),
      );
}
