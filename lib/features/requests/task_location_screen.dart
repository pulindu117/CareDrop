import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';

class TaskLocationScreen extends StatelessWidget {
  const TaskLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(
        title: 'Task Location',
        trailingText: 'Step 5 of 5',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                color: AppColors.surfaceContainerHigh,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 64, color: AppColors.surfaceContainerHighest),
                      SizedBox(height: 16),
                      Text('Interactive Map Placeholder'),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24.0),
              decoration: const BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Confirm Location',
                    style: AppTextStyles.headlineLgMobile,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Ward 4, Room 402 - City General Hospital',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 32),
                  CareDropButton(
                    text: 'Confirm Location',
                    onPressed: () => context.push(RouteNames.prescriptionUpload),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
