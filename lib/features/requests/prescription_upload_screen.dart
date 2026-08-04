import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';

class PrescriptionUploadScreen extends StatefulWidget {
  const PrescriptionUploadScreen({super.key});

  @override
  State<PrescriptionUploadScreen> createState() => _PrescriptionUploadScreenState();
}

class _PrescriptionUploadScreenState extends State<PrescriptionUploadScreen> {
  bool _hasDocument = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(title: 'Upload Document (Optional)'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Add Prescription',
                style: AppTextStyles.headlineLgMobile,
              ),
              const SizedBox(height: 8),
              Text(
                'Upload a photo of your prescription or relevant document to help the assistant.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              
              if (!_hasDocument)
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _hasDocument = true),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.cardBackground,
                        border: Border.all(color: AppColors.outlineVariant, style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.cloud_upload_outlined, size: 64, color: AppColors.primary),
                          const SizedBox(height: 16),
                          Text('Tap to upload or take a photo', style: AppTextStyles.titleMd),
                        ],
                      ),
                    ),
                  ),
                )
              else
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.cardBorder),
                    ),
                    child: Stack(
                      children: [
                        const Center(
                          child: Icon(Icons.document_scanner, size: 64, color: AppColors.onSurfaceVariant),
                        ),
                        Positioned(
                          top: 16,
                          right: 16,
                          child: IconButton(
                            icon: const Icon(Icons.close, color: AppColors.error),
                            onPressed: () => setState(() => _hasDocument = false),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
              const SizedBox(height: 24),
              CareDropButton(
                text: 'Review Request',
                onPressed: () => context.push(RouteNames.reviewRequest),
              ),
              if (!_hasDocument) ...[
                const SizedBox(height: 16),
                Center(
                  child: TextButton(
                    onPressed: () => context.push(RouteNames.reviewRequest),
                    child: Text(
                      'Skip this step',
                      style: AppTextStyles.titleMd.copyWith(color: AppColors.onSurfaceVariant),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
