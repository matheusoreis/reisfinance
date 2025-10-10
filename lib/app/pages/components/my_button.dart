import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color? color;
  final Color? textColor;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final double iconSize;
  final double spacing;

  const MyButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
    this.textColor,
    this.prefixIcon,
    this.suffixIcon,
    this.iconSize = 20,
    this.spacing = 8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final textStyle = theme.textTheme.titleMedium?.copyWith(
      color: textColor ?? scheme.surface,
    );

    final iconColor = textColor ?? scheme.surface;

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? scheme.primary,
        foregroundColor: iconColor,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (prefixIcon != null) ...[
            Icon(prefixIcon, color: iconColor, size: iconSize),
            SizedBox(width: spacing),
          ],
          Text(label, style: textStyle),
          if (suffixIcon != null) ...[
            SizedBox(width: spacing),
            Icon(suffixIcon, color: iconColor, size: iconSize),
          ],
        ],
      ),
    );
  }
}
