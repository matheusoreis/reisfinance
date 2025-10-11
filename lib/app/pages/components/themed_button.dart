import 'package:flutter/material.dart';
import 'package:reisfinance/app/utils/extensions/screen.dart';
import 'package:reisfinance/app/utils/functions/color.dart';

class ThemedButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final IconData? prefixIcon;
  final IconData? suffixIcon;

  const ThemedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colorByTheme(
          context,
          light: Theme.of(context).colorScheme.tertiary,
          dark: Theme.of(context).colorScheme.primary,
        ),
        foregroundColor: colorScheme.onSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            context.radius,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            Icon(
              prefixIcon,
              color: colorScheme.onSurface,
            ),
            SizedBox(width: 10),
          ],
          Text(
            label,
            style: theme.textTheme.titleMedium,
          ),
          if (suffixIcon != null) ...[
            SizedBox(width: 10),
            Icon(
              suffixIcon,
              color: colorScheme.onSurface,
            ),
          ],
        ],
      ),
    );
  }
}
