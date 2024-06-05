// lib/core/widgets/custom_button.dart

import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';

class KButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? color;
  final TextStyle? textStyle;
  final double? borderRadius;

  const KButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.textStyle,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          color ?? AppColors.button,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 16),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(text, style: textStyle ?? Theme.of(context).textTheme.labelMedium),
    );
  }
}
