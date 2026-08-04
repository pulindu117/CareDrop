import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';

class ActiveTaskTrackingScreen extends StatelessWidget {
  const ActiveTaskTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Active Task', showBackButton: false),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                color: AppColors.surfaceContainerHigh,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 64, color: AppColors.surfaceContainerHighest),
                      SizedBox(height: 16),
                      Text('Tracking Map Placeholder'),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(24.0),
                decoration: const BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(24),
                    topRight: Radius.circular(24),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('In Progress', style: AppTextStyles.headlineLgMobile.copyWith(color: AppColors.primary)),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text('CD-8842', style: AppTextStyles.labelMd),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text('Marcus is heading to the Pharmacy.', style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 32),
                    _buildTimeline(),
                    const Spacer(),
                    // MOCK ACTION: Simulating task completion
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.surfaceContainerHigh,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      onPressed: () => context.push(RouteNames.confirmCompletion),
                      child: Text('Simulate Assistant Completes Task', style: AppTextStyles.bodyMd),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        _buildTimelineStep(Icons.check_circle, 'Assistant matched', true, true),
        _buildTimelineStep(Icons.circle, 'Assistant arrived at origin', true, true),
        _buildTimelineStep(Icons.local_shipping, 'In Progress', true, false),
        _buildTimelineStep(Icons.radio_button_unchecked, 'Completed', false, false, isLast: true),
      ],
    );
  }

  Widget _buildTimelineStep(IconData icon, String title, bool isCompleted, bool isPast, {bool isLast = false}) {
    final color = isCompleted ? AppColors.primary : AppColors.onSurfaceVariant;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: color, size: 24),
            if (!isLast)
              Container(
                width: 2,
                height: 32,
                color: isPast ? AppColors.primary : AppColors.cardBorder,
              ),
          ],
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.0),
            child: Text(
              title,
              style: AppTextStyles.titleMd.copyWith(
                color: isCompleted ? AppColors.onSurface : AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
