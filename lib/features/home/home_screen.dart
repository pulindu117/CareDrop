import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/routing/route_names.dart';
import '../../widgets/caredrop_bottom_nav.dart';
import '../../services/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  void _onNavTap(int index) {
    setState(() => _currentIndex = index);
    if (index == 2) {
      context.push(RouteNames.selectCategory);
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = AuthService().currentUser;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: _currentIndex == 0 ? _buildHomeContent(user?.name ?? 'User') : _buildPlaceholder(),
      ),
      bottomNavigationBar: CareDropBottomNav(
        currentIndex: _currentIndex,
        onTap: _onNavTap,
      ),
    );
  }

  Widget _buildHomeContent(String userName) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome back,',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                  Text(
                    userName,
                    style: AppTextStyles.headlineLgMobile,
                  ),
                ],
              ),
              const CircleAvatar(
                radius: 24,
                backgroundColor: AppColors.surfaceContainerHigh,
                child: Icon(Icons.person, color: AppColors.onSurfaceVariant),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer.withValues(alpha: 0.1),
              border: Border.all(color: AppColors.primaryContainer.withValues(alpha: 0.3)),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(Icons.local_shipping, color: AppColors.onPrimaryContainer),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Need something?', style: AppTextStyles.titleMd),
                      const SizedBox(height: 4),
                      Text(
                        'Create a new request and get a trusted assistant.',
                        style: AppTextStyles.bodyMd.copyWith(color: AppColors.onSurfaceVariant),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Text('Recent Activity', style: AppTextStyles.titleMd),
          const SizedBox(height: 16),
          // Placeholder for recent tasks
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.cardBorder),
            ),
            child: Center(
              child: Column(
                children: [
                  const Icon(Icons.history, size: 48, color: AppColors.outlineVariant),
                  const SizedBox(height: 16),
                  Text(
                    'No recent activity',
                    style: AppTextStyles.bodyLg.copyWith(color: AppColors.onSurfaceVariant),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Center(
      child: Text('Tab $_currentIndex', style: AppTextStyles.headlineLg),
    );
  }
}
