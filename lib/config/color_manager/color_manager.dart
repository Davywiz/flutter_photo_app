import 'package:flutter/foundation.dart' show immutable;
import 'package:flutter/material.dart' show Color;
import 'package:flutter_photo_app/extensions/as_html_to_color.dart';

@immutable
class AppColors {
  const AppColors._();

  //main
  static final primaryColor = '#1B1B1B'.htmlColorToColor();

  static final darkColor = '#0A0A0A'.htmlColorToColor();
  static const Color light = Color.fromARGB(255, 255, 255, 255);
  static final backgroundColor = '#F5F5F5'.htmlColorToColor();

  //secondary
  static final textBlack = '#0A0A0A'.htmlColorToColor();
  static final textBlackFeint = '#333333'.htmlColorToColor();
}
