import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../models/task_category.dart';

class SelectCategoryScreen extends StatelessWidget {
  const SelectCategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(
        title: 'New Request',
        trailingText: 'Step 1 of 5',
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'What do you need help with?',
                style: AppTextStyles.headlineLgMobile,
              ),
              const SizedBox(height: 8),
              Text(
                'Select a category to match with the right assistant.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              _buildCategoryCard(
                context,
                TaskCategory.medicinePickup,
                Icons.medication_outlined,
                'Medicine Pickup',
                'Pharmacy to your room',
              ),
              _buildCategoryCard(
                context,
                TaskCategory.labReport,
                Icons.description_outlined,
                'Lab Reports',
                'Collect and deliver test results',
              ),
              _buildCategoryCard(
                context,
                TaskCategory.queueAssistance,
                Icons.people_alt_outlined,
                'Queue Assistance',
                'Stand in line on your behalf',
              ),
              _buildCategoryCard(
                context,
                TaskCategory.foodDelivery,
                Icons.restaurant_outlined,
                'Food Delivery',
                'Cafeteria or outside food',
              ),
              _buildCategoryCard(
                context,
                TaskCategory.essentialItems,
                Icons.shopping_bag_outlined,
                'Essential Items',
                'Clothes, toiletries, or chargers',
              ),
              _buildCategoryCard(
                context,
                TaskCategory.other,
                Icons.more_horiz,
                'Other',
                'Custom requests',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, TaskCategory category, IconData icon, String title, String subtitle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: InkWell(
        onTap: () {
          // In a real app we'd pass state. For simplicity, just navigating.
          context.push(RouteNames.taskDetails, extra: category);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            border: Border.all(color: AppColors.cardBorder),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: AppColors.primary, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: AppTextStyles.titleMd),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: AppColors.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}
