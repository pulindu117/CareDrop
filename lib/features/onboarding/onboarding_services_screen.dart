import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_progress_bar.dart';

class OnboardingServicesScreen extends StatelessWidget {
  const OnboardingServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        children: [
          // Background placeholder for image
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              color: AppColors.surfaceContainerHigh,
              child: const Center(
                child: Icon(
                  Icons.medication,
                  size: 100,
                  color: AppColors.surfaceContainerHighest,
                ),
              ),
            ),
          ),
          
          // Gradient overlay
          Positioned(
            top: MediaQuery.of(context).size.height * 0.35,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.3,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.transparent,
                    AppColors.background,
                  ],
                ),
              ),
            ),
          ),
          
          // Content
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.all(24.0),
              color: AppColors.background,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CareDropProgressBar(
                    totalSteps: 2,
                    currentStep: 2,
                    variant: ProgressBarVariant.dots,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'From pharmacy to bedside.',
                    style: AppTextStyles.headlineLg,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Get medicines, reports, and essentials delivered right to you by our verified community assistants.',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 48),
                  CareDropButton(
                    text: 'Get Started',
                    onPressed: () => context.go(RouteNames.login),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
