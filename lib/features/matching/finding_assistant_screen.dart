import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../services/request_service.dart';

class FindingAssistantScreen extends StatefulWidget {
  const FindingAssistantScreen({super.key});

  @override
  State<FindingAssistantScreen> createState() => _FindingAssistantScreenState();
}

class _FindingAssistantScreenState extends State<FindingAssistantScreen> with SingleTickerProviderStateMixin {
  late AnimationController _pulseController;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _pulseController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    
    _scaleAnimation = Tween<double>(begin: 0.95, end: 1.05).animate(
      CurvedAnimation(parent: _pulseController, curve: Curves.easeInOut),
    );

    _simulateMatching();
  }

  void _simulateMatching() async {
    // Uses the mock RequestService to simulate finding an assistant
    await RequestService().findAssistantForRequest('mock_id');
    if (mounted) {
      context.push(RouteNames.assistantFound);
    }
  }

  @override
  void dispose() {
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ScaleTransition(
              scale: _scaleAnimation,
              child: Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryContainer.withValues(alpha: 0.2),
                  border: Border.all(color: AppColors.primary, width: 2),
                ),
                child: const Icon(
                  Icons.search,
                  size: 64,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(height: 48),
            Text(
              'Finding your assistant...',
              style: AppTextStyles.headlineLgMobile,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              'Looking for the best match nearby to handle your request.',
              style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
