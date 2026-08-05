import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

enum CareDropButtonVariant { primary, outlined, ghost }

class CareDropButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final CareDropButtonVariant variant;
  final IconData? icon;
  final bool isLoading;

  const CareDropButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.variant = CareDropButtonVariant.primary,
    this.icon,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDisabled = onPressed == null || isLoading;

    switch (variant) {
      case CareDropButtonVariant.primary:
        return _buildPrimary(isDisabled);
      case CareDropButtonVariant.outlined:
        return _buildOutlined(isDisabled);
      case CareDropButtonVariant.ghost:
        return _buildGhost(isDisabled);
    }
  }

  Widget _buildPrimary(bool isDisabled) {
    return Container(
      decoration: BoxDecoration(
        color: isDisabled ? AppColors.surfaceContainerHigh : AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: isDisabled
            ? null
            : [
                const BoxShadow(
                  color: Colors.black26,
                  blurRadius: 12,
                  offset: Offset(0, 4),
                )
              ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Stack(
            children: [
              // Glint effect
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                height: 1,
                child: Container(
                  color: Colors.white.withValues(alpha: 0.1),
                ),
              ),
              Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (isLoading)
                      const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(AppColors.onPrimaryContainer),
                        ),
                      )
                    else ...[
                      Text(
                        text,
                        style: AppTextStyles.titleMd.copyWith(
                          color: isDisabled ? AppColors.onSurfaceVariant : AppColors.onPrimaryContainer,
                        ),
                      ),
                      if (icon != null) ...[
                        const SizedBox(width: 8),
                        Icon(
                          icon,
                          size: 20,
                          color: isDisabled ? AppColors.onSurfaceVariant : AppColors.onPrimaryContainer,
                        ),
                      ],
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOutlined(bool isDisabled) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        border: Border.all(
          color: isDisabled ? AppColors.outlineVariant : AppColors.outline,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.onSurface),
                    ),
                  )
                else ...[
                  Text(
                    text,
                    style: AppTextStyles.titleMd.copyWith(
                      color: isDisabled ? AppColors.onSurfaceVariant : AppColors.onSurface,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      icon,
                      size: 20,
                      color: isDisabled ? AppColors.onSurfaceVariant : AppColors.onSurface,
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGhost(bool isDisabled) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(8.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  )
                else ...[
                  Text(
                    text,
                    style: AppTextStyles.titleMd.copyWith(
                      color: isDisabled ? AppColors.onSurfaceVariant : AppColors.primary,
                    ),
                  ),
                  if (icon != null) ...[
                    const SizedBox(width: 8),
                    Icon(
                      icon,
                      size: 20,
                      color: isDisabled ? AppColors.onSurfaceVariant : AppColors.primary,
                    ),
                  ],
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
