import 'package:flutter/material.dart';

Color colorByTheme(
  BuildContext context, {
  required Color light,
  required Color dark,
}) {
  final brightness = Theme.of(context).brightness;
  return brightness == Brightness.light ? light : dark;
}
