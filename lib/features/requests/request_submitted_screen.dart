import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';

class RequestSubmittedScreen extends StatelessWidget {
  const RequestSubmittedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 80,
                color: AppColors.tertiary,
              ),
              const SizedBox(height: 32),
              Text(
                'Request Submitted',
                style: AppTextStyles.headlineLg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We are now matching you with a trusted community assistant nearby.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              CareDropButton(
                text: 'View Status',
                onPressed: () => context.go(RouteNames.findingAssistant),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
