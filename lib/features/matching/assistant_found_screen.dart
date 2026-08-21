import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_app_bar.dart';
import '../../widgets/caredrop_button.dart';
import '../../services/request_service.dart';
import '../../models/community_assistant.dart';

class AssistantFoundScreen extends StatefulWidget {
  const AssistantFoundScreen({super.key});

  @override
  State<AssistantFoundScreen> createState() => _AssistantFoundScreenState();
}

class _AssistantFoundScreenState extends State<AssistantFoundScreen> {
  CommunityAssistant? _assistant;

  @override
  void initState() {
    super.initState();
    _loadAssistant();
  }

  void _loadAssistant() async {
    // In a real app we would already have this object passed or fetch by ID
    final assistant = await RequestService().findAssistantForRequest('mock_id');
    setState(() => _assistant = assistant);
  }

  @override
  Widget build(BuildContext context) {
    if (_assistant == null) {
      return const Scaffold(
        backgroundColor: AppColors.background,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: const CareDropAppBar(title: 'Match Found'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'We found a match!',
                style: AppTextStyles.headlineLgMobile,
              ),
              const SizedBox(height: 8),
              Text(
                'Review the assistant\'s profile and confirm to start.',
                style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              ),
              const SizedBox(height: 32),
              
              Container(
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.cardBackground,
                  border: Border.all(color: AppColors.cardBorder),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 48,
                          backgroundColor: AppColors.surfaceContainerHigh,
                          child: Icon(Icons.person, size: 48, color: AppColors.onSurfaceVariant),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.all(4),
                            decoration: const BoxDecoration(
                              color: AppColors.background,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(Icons.verified, color: AppColors.primary, size: 24),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(_assistant!.name, style: AppTextStyles.titleMd),
                    const SizedBox(height: 4),
                    Text('Community Assistant', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.star, color: AppColors.primary, size: 20),
                        const SizedBox(width: 4),
                        Text('${_assistant!.rating}', style: AppTextStyles.titleMd),
                        const SizedBox(width: 16),
                        Container(width: 1, height: 24, color: AppColors.cardBorder),
                        const SizedBox(width: 16),
                        Text('${_assistant!.completedTasks}', style: AppTextStyles.titleMd),
                        const SizedBox(width: 4),
                        Text('Tasks', style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant)),
                      ],
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              Center(
                child: TextButton(
                  onPressed: () => context.push(RouteNames.assistantProfile),
                  child: Text(
                    'View Full Profile',
                    style: AppTextStyles.titleMd.copyWith(color: AppColors.primary),
                  ),
                ),
              ),
              
              const Spacer(),
              CareDropButton(
                text: 'Confirm Assistant',
                onPressed: () => context.push(RouteNames.activeTracking),
              ),
              const SizedBox(height: 16),
              CareDropButton(
                text: 'Cancel Request',
                variant: CareDropButtonVariant.outlined,
                onPressed: () => context.go(RouteNames.home),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
