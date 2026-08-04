import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_text_field.dart';
import '../../models/hospital.dart';

class HospitalInfoScreen extends StatefulWidget {
  const HospitalInfoScreen({super.key});

  @override
  State<HospitalInfoScreen> createState() => _HospitalInfoScreenState();
}

class _HospitalInfoScreenState extends State<HospitalInfoScreen> {
  final _searchController = TextEditingController();
  
  // Mock data
  final List<Hospital> _hospitals = [
    Hospital(
      id: 'h1',
      name: 'City General Hospital',
      address: '123 Health Ave, Medical District',
      mapImageUrl: '',
    ),
    Hospital(
      id: 'h2',
      name: 'St. Mary\'s Medical Center',
      address: '456 Care Blvd, Westside',
      mapImageUrl: '',
    ),
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CareDropAppBar(
        title: 'Select Hospital',
        trailingText: 'Step 3 of 5',
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Which hospital?',
                    style: AppTextStyles.headlineLgMobile,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Search for the hospital where the task will take place.',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  const SizedBox(height: 24),
                  CareDropTextField(
                    label: 'Search hospitals',
                    controller: _searchController,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = _hospitals[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: InkWell(
                      onTap: () => context.push(RouteNames.dateTime),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppColors.cardBackground,
                          border: Border.all(color: AppColors.cardBorder),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.local_hospital, color: AppColors.primary, size: 32),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(hospital.name, style: AppTextStyles.titleMd),
                                  const SizedBox(height: 4),
                                  Text(
                                    hospital.address,
                                    style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
