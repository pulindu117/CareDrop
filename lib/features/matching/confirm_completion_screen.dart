import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';

class ConfirmCompletionScreen extends StatelessWidget {
  const ConfirmCompletionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 32),
              Center(
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    color: AppColors.surfaceContainerHigh,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.primaryContainer, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryContainer.withOpacity(0.5),
                        blurRadius: 24,
                      )
                    ],
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    size: 48,
                    color: AppColors.primaryContainer,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Task Completed',
                style: AppTextStyles.headlineLg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Marcus Lee has marked the task as completed. Please review and confirm.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              
              Container(
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(color: Colors.black26, blurRadius: 16, offset: Offset(0, 8))
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Row(
                        children: [
                          const Icon(Icons.assignment, color: AppColors.primary, size: 24),
                          const SizedBox(width: 12),
                          Text('Task Summary', style: AppTextStyles.titleMd),
                        ],
                      ),
                    ),
                    const Divider(color: AppColors.cardBorder, height: 1),
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          _buildDetailRow('TASK ID', '#CD-8842'),
                          const SizedBox(height: 16),
                          _buildDetailRow('TYPE', 'Equipment Transport'),
                          const SizedBox(height: 16),
                          _buildDetailRow('COMPLETED BY', 'Marcus Lee'),
                          const SizedBox(height: 16),
                          _buildDetailRow('TIME COMPLETED', 'Just now'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              
              const Spacer(),
              CareDropButton(
                text: 'Confirm Completion',
                icon: Icons.thumb_up,
                onPressed: () => context.go(RouteNames.home),
              ),
              const SizedBox(height: 16),
              CareDropButton(
                text: 'Report an Issue',
                icon: Icons.report_problem,
                variant: CareDropButtonVariant.outlined,
                onPressed: () {}, // Handled outside prototype scope
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.bodyLg),
      ],
    );
  }
}
