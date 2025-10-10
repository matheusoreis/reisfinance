import 'package:flutter/material.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';

class SurfaceCard extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;

  const SurfaceCard({
    super.key,
    this.child,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Card(
      color: colorScheme.surfaceContainerHigh,
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
