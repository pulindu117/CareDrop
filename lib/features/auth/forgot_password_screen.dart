import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_text_field.dart';
import '../../widgets/caredrop_app_bar.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isLoading = false;
  bool _isSent = false;

  void _handleReset() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isSent = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Reset Password'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: _isSent ? _buildSuccessState() : _buildFormState(),
        ),
      ),
    );
  }

  Widget _buildFormState() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Forgot your password?',
            style: AppTextStyles.headlineLg,
          ),
          const SizedBox(height: 8),
          Text(
            'Enter your email address and we\'ll send you a link to reset your password.',
            style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
          ),
          const SizedBox(height: 48),
          CareDropTextField(
            label: 'Email Address',
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
            validator: (value) {
              if (value == null || value.isEmpty) return 'Required';
              if (!value.contains('@')) return 'Invalid email';
              return null;
            },
          ),
          const SizedBox(height: 32),
          CareDropButton(
            text: 'Send Reset Link',
            isLoading: _isLoading,
            onPressed: _handleReset,
          ),
        ],
      ),
    );
  }

  Widget _buildSuccessState() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.check_circle_outline,
          size: 64,
          color: AppColors.tertiary,
        ),
        const SizedBox(height: 32),
        Text(
          'Email Sent',
          style: AppTextStyles.headlineLg,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'We\'ve sent a password reset link to ${_emailController.text}. Please check your inbox.',
          style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48),
        CareDropButton(
          text: 'Return to Login',
          onPressed: () => context.pop(),
        ),
      ],
    );
  }
}
