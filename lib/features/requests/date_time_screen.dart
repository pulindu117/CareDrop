import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';

class DateTimeScreen extends StatefulWidget {
  const DateTimeScreen({super.key});

  @override
  State<DateTimeScreen> createState() => _DateTimeScreenState();
}

class _DateTimeScreenState extends State<DateTimeScreen> {
  bool _isAsap = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(
        title: 'Date & Time',
        trailingText: 'Step 4 of 5',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'When do you need it?',
                style: AppTextStyles.headlineLgMobile,
              ),
              const SizedBox(height: 8),
              Text(
                'Select ASAP for urgent requests, or schedule for later.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              _buildOptionCard(
                title: 'As Soon As Possible',
                subtitle: 'Match with the nearest available assistant',
                icon: Icons.flash_on,
                isSelected: _isAsap,
                onTap: () => setState(() => _isAsap = true),
              ),
              const SizedBox(height: 16),
              _buildOptionCard(
                title: 'Schedule for Later',
                subtitle: 'Pick a specific date and time',
                icon: Icons.calendar_month,
                isSelected: !_isAsap,
                onTap: () => setState(() => _isAsap = false),
              ),
              
              if (!_isAsap) ...[
                const SizedBox(height: 24),
                // Simple placeholder for date picker
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.inputBackground,
                    border: Border.all(color: AppColors.outlineVariant),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tomorrow, 10:00 AM', style: AppTextStyles.bodyLg),
                      const Icon(Icons.edit, color: AppColors.primary),
                    ],
                  ),
                ),
              ],
              
              const Spacer(),
              CareDropButton(
                text: 'Continue',
                onPressed: () => context.push(RouteNames.taskLocation),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOptionCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          border: Border.all(
            color: isSelected ? AppColors.primary : AppColors.cardBorder,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primaryContainer.withValues(alpha: 0.2) : AppColors.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: isSelected ? AppColors.primary : AppColors.onSurfaceVariant),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleMd),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            if (isSelected)
              const Icon(Icons.check_circle, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}
