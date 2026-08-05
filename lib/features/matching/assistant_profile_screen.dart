import 'package:flutter/material.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/caredrop_app_bar.dart';

class AssistantProfileScreen extends StatelessWidget {
  const AssistantProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 48,
                          backgroundColor: AppColors.surfaceContainerHigh,
                          child: Icon(Icons.person, size: 48, color: AppColors.onSurfaceVariant),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.background,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.verified, color: AppColors.primary, size: 24),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Marcus Lee', style: AppTextStyles.titleMd),
                        const SizedBox(width: 8),
                        const Icon(Icons.verified, color: AppColors.primary, size: 20),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text('Community Assistant', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 8),
                    Text('Member since 2023', style: AppTextStyles.labelMd.copyWith(color: AppColors.outline)),
                    const SizedBox(height: 24),
                    const Divider(color: AppColors.cardBorder),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.star, color: AppColors.primary, size: 20),
                                const SizedBox(width: 4),
                                Text('4.9', style: AppTextStyles.titleMd),
                              ],
                            ),
                          ],
                        ),
                        Container(width: 1, height: 24, color: AppColors.cardBorder),
                        Column(
                          children: [
                            Text('124', style: AppTextStyles.titleMd),
                            Text('Tasks Completed', style: AppTextStyles.labelMd.copyWith(color: AppColors.onSurfaceVariant)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              _buildTrustSection(),
              const SizedBox(height: 24),
              _buildAboutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTrustSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('VERIFICATION & TRUST', style: AppTextStyles.labelMd.copyWith(color: AppColors.primary)),
          const SizedBox(height: 16),
          _buildTrustItem(Icons.check_circle, 'Phone Verified', AppColors.tertiary),
          _buildTrustItem(Icons.mark_email_read, 'Email Verified', AppColors.tertiary),
          _buildTrustItem(Icons.fiber_manual_record, '100% Completion Rate', AppColors.secondary),
          _buildTrustItem(Icons.gpp_good, 'Background Checked', AppColors.outline),
        ],
      ),
    );
  }

  Widget _buildTrustItem(IconData icon, String text, Color color) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.surfaceContainer,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 12),
          Text(text, style: AppTextStyles.bodyMd),
        ],
      ),
    );
  }

  Widget _buildAboutSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBackground.withValues(alpha: 0.8),
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('About Marcus', style: AppTextStyles.titleMd),
          const SizedBox(height: 16),
          Text(
            'Dedicated professional with extensive experience in high-stakes coordination and community assistance. Specializing in rapid response and calm, reliable execution of logistics tasks.',
            style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
