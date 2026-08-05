import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class CareDropBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CareDropBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceContainerLow,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 24,
            offset: Offset(0, -4),
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(icon: Icons.home_outlined, label: 'Home', index: 0),
            _buildNavItem(icon: Icons.assignment_outlined, label: 'Requests', index: 1),
            _buildCreateButton(),
            _buildNavItem(icon: Icons.chat_bubble_outline, label: 'Messages', index: 3),
            _buildNavItem(icon: Icons.person_outline, label: 'Profile', index: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem({required IconData icon, required String label, required int index}) {
    final isSelected = currentIndex == index;
    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: AppTextStyles.labelMd.copyWith(
              color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCreateButton() {
    return GestureDetector(
      onTap: () => onTap(2),
      child: Container(
        margin: const EdgeInsets.only(top: -24), // Lifted appearance
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.primaryContainer,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.surface, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.add_circle_outline,
              color: AppColors.onPrimaryContainer,
              size: 28,
            ),
            Text(
              'Create',
              style: AppTextStyles.labelMd.copyWith(
                color: AppColors.onPrimaryContainer,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
