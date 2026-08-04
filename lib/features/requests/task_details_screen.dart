import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';
import '../../widgets/caredrop_text_field.dart';
import '../../models/task_category.dart';

class TaskDetailsScreen extends StatefulWidget {
  final TaskCategory category;
  
  const TaskDetailsScreen({super.key, required this.category});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _detailsController = TextEditingController();

  void _handleNext() {
    if (_formKey.currentState!.validate()) {
      context.push(RouteNames.hospitalInfo);
    }
  }

  @override
  void dispose() {
    _detailsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(
        title: 'Task Details',
        trailingText: 'Step 2 of 5',
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'What exactly do you need?',
                  style: AppTextStyles.headlineLgMobile,
                ),
                const SizedBox(height: 8),
                Text(
                  'Provide specific details for the ${widget.category.displayName} request.',
                  style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                ),
                const SizedBox(height: 32),
                Expanded(
                  child: TextFormField(
                    controller: _detailsController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    style: AppTextStyles.bodyLg,
                    validator: (value) => value == null || value.isEmpty ? 'Please provide details' : null,
                    decoration: InputDecoration(
                      hintText: 'e.g. Please pick up my prescription from the main pharmacy. The order number is #12345.',
                      hintStyle: AppTextStyles.bodyLg.copyWith(color: AppColors.outlineVariant),
                      filled: true,
                      fillColor: AppColors.inputBackground,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.cardBorder),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.cardBorder),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: AppColors.primary),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                CareDropButton(
                  text: 'Continue',
                  onPressed: _handleNext,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
