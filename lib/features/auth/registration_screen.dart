import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_text_field.dart';
import '../../widgets/caredrop_app_bar.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _handleRegister() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      // Simulate network request
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        context.push(RouteNames.phoneVerify);
      }
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Create Account'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Join CareDrop',
                  style: AppTextStyles.headlineLg,
                ),
                const SizedBox(height: 8),
                Text(
                  'Enter your details to get started.',
                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                CareDropTextField(
                  label: 'Full Name',
                  controller: _nameController,
                  validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
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
                const SizedBox(height: 16),
                CareDropTextField(
                  label: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  controller: _phoneController,
                  validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                CareDropTextField(
                  label: 'Password',
                  isPassword: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Required';
                    if (value.length < 6) return 'At least 6 characters';
                    return null;
                  },
                ),
                const SizedBox(height: 32),
                CareDropButton(
                  text: 'Continue',
                  isLoading: _isLoading,
                  onPressed: _handleRegister,
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                    GestureDetector(
                      onTap: () => context.go(RouteNames.login),
                      child: Text(
                        'Log In',
                        style: AppTextStyles.titleMd.copyWith(color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
