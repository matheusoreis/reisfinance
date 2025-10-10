import 'package:flutter/material.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class PageIndicator extends StatelessWidget {
  final int count;
  final int currentIndex;
  final Color? activeColor;
  final Color? inactiveColor;
  final double size;
  final double spacing;

  const PageIndicator({
    super.key,
    required this.count,
    required this.currentIndex,
    this.activeColor,
    this.inactiveColor,
    this.size = 10,
    this.spacing = 4,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
        (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: EdgeInsets.symmetric(horizontal: spacing),
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? (activeColor ??
                      colorByTheme(
                        context,
                        light: theme.primary,
                        dark: theme.tertiary,
                      ))
                : (inactiveColor ?? theme.outlineVariant),
          ),
        ),
      ),
    );
  }
}
