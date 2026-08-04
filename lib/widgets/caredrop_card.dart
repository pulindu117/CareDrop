import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

class CareDropCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const CareDropCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(24.0),
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final card = Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 16,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: padding,
              child: child,
            ),
          ),
        ),
      ),
    );

    return card;
  }
}
