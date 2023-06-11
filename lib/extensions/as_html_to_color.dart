// Converts  0x????? or #????? to Color
import 'package:flutter/material.dart';
import './remove_all.dart';

extension AsHtmlCOlorToColor on String {
  Color htmlColorToColor() => Color(
        int.parse(
          removeAll(['0x', '#']).padLeft(8, 'ff'),
          radix: 16,
        ),
      );
}
