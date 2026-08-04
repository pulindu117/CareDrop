import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';
import '../../services/request_service.dart';
import '../../models/task_category.dart';

class ReviewRequestScreen extends StatefulWidget {
  const ReviewRequestScreen({super.key});

  @override
  State<ReviewRequestScreen> createState() => _ReviewRequestScreenState();
}

class _ReviewRequestScreenState extends State<ReviewRequestScreen> {
  bool _isLoading = false;

  void _handleSubmit() async {
    setState(() => _isLoading = true);
    
    // Create the mock task request
    await RequestService().createRequest(
      category: TaskCategory.medicinePickup,
      origin: 'Central Pharmacy',
      destination: 'Ward 4, Room 402',
      scheduledTime: DateTime.now(),
      notes: 'Please pick up prescription #12345.',
    );
    
    if (mounted) {
      setState(() => _isLoading = false);
      context.push(RouteNames.requestSubmitted);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Review Request'),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Almost done!',
                style: AppTextStyles.headlineLgMobile,
              ),
              const SizedBox(height: 8),
              Text(
                'Review your task details before confirming.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              
              _buildSummarySection(
                title: 'Task Details',
                content: 'Medicine Pickup\nPlease pick up prescription #12345.',
                onEdit: () {}, // In real app, pop to specific screen
              ),
              const SizedBox(height: 16),
              _buildSummarySection(
                title: 'Hospital',
                content: 'City General Hospital',
                onEdit: () {},
              ),
              const SizedBox(height: 16),
              _buildSummarySection(
                title: 'Date & Time',
                content: 'As Soon As Possible',
                onEdit: () {},
              ),
              const SizedBox(height: 16),
              _buildSummarySection(
                title: 'Location',
                content: 'Ward 4, Room 402',
                onEdit: () {},
              ),
              
              const SizedBox(height: 48),
              CareDropButton(
                text: 'Submit Request',
                isLoading: _isLoading,
                onPressed: _handleSubmit,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSummarySection({required String title, required String content, required VoidCallback onEdit}) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        border: Border.all(color: AppColors.cardBorder),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTextStyles.titleMd),
              GestureDetector(
                onTap: onEdit,
                child: const Icon(Icons.edit, color: AppColors.primary, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            content,
            style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }
}
