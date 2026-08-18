import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 48),
              Text(
                'CareDrop',
                style: AppTextStyles.titleMd.copyWith(color: AppColors.primary),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              Text(
                'Select your role',
                style: AppTextStyles.headlineLg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Choose how you want to use CareDrop today.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              
              _RoleCard(
                title: 'I am a Patient',
                description: 'Someone needing help with hospital errands and logistics.',
                icon: Icons.person_outline,
                onTap: () => _navigateToNext(context),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                title: 'I am a Guardian',
                description: 'Helping a loved one manage their hospital tasks and care.',
                icon: Icons.family_restroom,
                onTap: () => _navigateToNext(context),
              ),
              const SizedBox(height: 16),
              _RoleCard(
                title: 'I want to become a Community Assistant',
                description: 'Providing help to patients and earning through logistics support.',
                icon: Icons.volunteer_activism,
                onTap: () => _navigateToNext(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToNext(BuildContext context) {
    context.push(RouteNames.onboardingIntro);
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          border: Border.all(color: AppColors.cardBorder),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: AppColors.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: AppTextStyles.titleMd),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
