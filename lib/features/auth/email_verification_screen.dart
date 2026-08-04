import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_app_bar.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
  bool _isLoading = false;

  void _verifyEmail() async {
    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      setState(() => _isLoading = false);
      context.go(RouteNames.profileSetup);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Verify Email'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(
                Icons.mark_email_unread_outlined,
                size: 64,
                color: AppColors.primary,
              ),
              const SizedBox(height: 32),
              Text(
                'Check your inbox',
                style: AppTextStyles.headlineLg,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'We\'ve sent a verification link to your email address. Please click the link to verify your account.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              CareDropButton(
                text: 'I\'ve Verified My Email',
                isLoading: _isLoading,
                onPressed: _verifyEmail,
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Simulate resend
                  },
                  child: Text(
                    'Resend Link',
                    style: AppTextStyles.titleMd.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
