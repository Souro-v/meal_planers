import 'package:flutter/material.dart';
import '../../app/themes/app_colors.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color color;

  const LoadingIndicator({
    super.key,
    this.size = 40,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: size, width: size,
        child: CircularProgressIndicator(
          color: color,
          strokeWidth: 3,
        ),
      ),
    );
  }
}

// Full screen loading overlay
class LoadingOverlay extends StatelessWidget {
  final bool isLoading;
  final Widget child;

  const LoadingOverlay({
    super.key,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isLoading)
          const ColoredBox(
            color: Color(0x80FFFFFF),
            child: LoadingIndicator(),
          ),
      ],
    );
  }
}