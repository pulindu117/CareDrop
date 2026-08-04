import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_progress_bar.dart';

class OnboardingIntroScreen extends StatelessWidget {
  const OnboardingIntroScreen({super.key});

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
                  Icons.local_hospital,
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
                    currentStep: 1,
                    variant: ProgressBarVariant.dots,
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Hospital errands, without the extra stress.',
                    style: AppTextStyles.headlineLg,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'CareDrop helps patients and guardians request trusted help with non-clinical hospital logistics.',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 48),
                  CareDropButton(
                    text: 'Continue',
                    icon: Icons.arrow_forward,
                    onPressed: () => context.push(RouteNames.onboardingServices),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () => context.go(RouteNames.login),
                      child: Text(
                        'Skip',
                        style: AppTextStyles.titleMd.copyWith(color: AppColors.primary),
                      ),
                    ),
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
