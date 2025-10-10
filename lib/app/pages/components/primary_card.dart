import 'package:flutter/material.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class PrimaryCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const PrimaryCard({
    super.key,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorByTheme(
        context,
        light: colorScheme.primary,
        dark: colorScheme.tertiary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.radius),
      ),
      child: Padding(
        padding: padding ?? EdgeInsets.all(context.padding),
        child: child,
      ),
    );
  }
}
