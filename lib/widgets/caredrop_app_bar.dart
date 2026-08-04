import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CareDropAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final String? trailingText;
  final VoidCallback? onBackPressed;

  const CareDropAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.trailingText,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      centerTitle: true,
      leading: showBackButton
          ? IconButton(
              icon: const Icon(Icons.arrow_back, color: AppColors.onSurfaceVariant),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            )
          : const SizedBox.shrink(),
      title: Text(
        title,
        style: AppTextStyles.headlineLgMobile.copyWith(
          color: AppColors.primary,
        ),
      ),
      actions: trailingText != null
          ? [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Text(
                    trailingText!,
                    style: AppTextStyles.labelMd.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            ]
          : const [SizedBox(width: 48)], // To balance the back button
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
