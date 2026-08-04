import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_text_field.dart';
import '../../widgets/caredrop_app_bar.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  final _addressController = TextEditingController();
  final _emergencyContactController = TextEditingController();
  bool _isLoading = false;

  void _handleComplete() async {
    if (_formKey.currentState!.validate()) {
      setState(() => _isLoading = true);
      await Future.delayed(const Duration(seconds: 2));
      if (mounted) {
        setState(() => _isLoading = false);
        context.go(RouteNames.home);
      }
    }
  }

  @override
  void dispose() {
    _addressController.dispose();
    _emergencyContactController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Complete Profile'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceContainerHighest,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppColors.primary, width: 2),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 48,
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: AppColors.primary,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.camera_alt,
                            size: 16,
                            color: AppColors.onPrimary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),
                CareDropTextField(
                  label: 'Home Address',
                  controller: _addressController,
                  validator: (value) => value == null || value.isEmpty ? 'Required' : null,
                ),
                const SizedBox(height: 16),
                CareDropTextField(
                  label: 'Emergency Contact Phone',
                  keyboardType: TextInputType.phone,
                  controller: _emergencyContactController,
                ),
                const SizedBox(height: 48),
                CareDropButton(
                  text: 'Complete Setup',
                  isLoading: _isLoading,
                  onPressed: _handleComplete,
                ),
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.go(RouteNames.home),
                    child: Text(
                      'Skip for now',
                      style: AppTextStyles.titleMd.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
