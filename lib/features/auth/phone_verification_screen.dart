import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_otp_field.dart';
import '../../widgets/caredrop_app_bar.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({super.key});

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  bool _isLoading = false;
  String _otp = '';

  void _verifyOtp() async {
    if (_otp.length == 6) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        context.push(RouteNames.emailVerify);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Verify Phone'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Enter verification code',
                style: AppTextStyles.headlineLg,
              ),
              const SizedBox(height: 8),
              Text(
                'We\'ve sent a 6-digit code to your phone number.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 48),
              CareDropOtpField(
                length: 6,
                onChanged: (value) {
                  setState(() => _otp = value);
                },
                onCompleted: _verifyOtp,
              ),
              const SizedBox(height: 48),
              CareDropButton(
                text: 'Verify',
                isLoading: _isLoading,
                onPressed: _otp.length == 6 ? _verifyOtp : null,
              ),
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () {
                    // Simulate resend
                  },
                  child: Text(
                    'Resend Code',
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
