import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'route_names.dart';

import '../../features/splash/splash_screen.dart';
import '../../features/onboarding/role_selection_screen.dart';
import '../../features/onboarding/onboarding_intro_screen.dart';
import '../../features/onboarding/onboarding_services_screen.dart';
import '../../features/auth/login_screen.dart';
import '../../features/auth/registration_screen.dart';
import '../../features/auth/phone_verification_screen.dart';
import '../../features/auth/email_verification_screen.dart';
import '../../features/auth/forgot_password_screen.dart';
import '../../features/profile/profile_setup_screen.dart';
import '../../features/home/home_screen.dart';
import '../../features/requests/select_category_screen.dart';
import '../../features/requests/task_details_screen.dart';
import '../../features/requests/hospital_info_screen.dart';
import '../../features/requests/date_time_screen.dart';
import '../../features/requests/task_location_screen.dart';
import '../../features/requests/prescription_upload_screen.dart';
import '../../features/requests/review_request_screen.dart';
import '../../features/requests/request_submitted_screen.dart';
import '../../features/matching/finding_assistant_screen.dart';
import '../../features/matching/assistant_found_screen.dart';
import '../../features/matching/assistant_profile_screen.dart';
import '../../features/matching/active_task_tracking_screen.dart';
import '../../features/matching/confirm_completion_screen.dart';
import '../../models/task_category.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: RouteNames.roleSelection,
        builder: (context, state) => const RoleSelectionScreen(),
      ),
      GoRoute(
        path: RouteNames.onboardingIntro,
        builder: (context, state) => const OnboardingIntroScreen(),
      ),
      GoRoute(
        path: RouteNames.onboardingServices,
        builder: (context, state) => const OnboardingServicesScreen(),
      ),
      GoRoute(
        path: RouteNames.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RouteNames.register,
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: RouteNames.phoneVerify,
        builder: (context, state) => const PhoneVerificationScreen(),
      ),
      GoRoute(
        path: RouteNames.emailVerify,
        builder: (context, state) => const EmailVerificationScreen(),
      ),
      GoRoute(
        path: RouteNames.forgotPassword,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
      GoRoute(
        path: RouteNames.profileSetup,
        builder: (context, state) => const ProfileSetupScreen(),
      ),
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RouteNames.selectCategory,
        builder: (context, state) => const SelectCategoryScreen(),
      ),
      GoRoute(
        path: RouteNames.taskDetails,
        builder: (context, state) {
          final category = state.extra as TaskCategory? ?? TaskCategory.other;
          return TaskDetailsScreen(category: category);
        },
      ),
      GoRoute(
        path: RouteNames.hospitalInfo,
        builder: (context, state) => const HospitalInfoScreen(),
      ),
      GoRoute(
        path: RouteNames.dateTime,
        builder: (context, state) => const DateTimeScreen(),
      ),
      GoRoute(
        path: RouteNames.taskLocation,
        builder: (context, state) => const TaskLocationScreen(),
      ),
      GoRoute(
        path: RouteNames.prescriptionUpload,
        builder: (context, state) => const PrescriptionUploadScreen(),
      ),
      GoRoute(
        path: RouteNames.reviewRequest,
        builder: (context, state) => const ReviewRequestScreen(),
      ),
      GoRoute(
        path: RouteNames.requestSubmitted,
        builder: (context, state) => const RequestSubmittedScreen(),
      ),
      GoRoute(
        path: RouteNames.findingAssistant,
        builder: (context, state) => const FindingAssistantScreen(),
      ),
      GoRoute(
        path: RouteNames.assistantFound,
        builder: (context, state) => const AssistantFoundScreen(),
      ),
      GoRoute(
        path: RouteNames.assistantProfile,
        builder: (context, state) => const AssistantProfileScreen(),
      ),
      GoRoute(
        path: RouteNames.activeTracking,
        builder: (context, state) => const ActiveTaskTrackingScreen(),
      ),
      GoRoute(
        path: RouteNames.confirmCompletion,
        builder: (context, state) => const ConfirmCompletionScreen(),
      ),
      // Add more routes here as we build the screens
    ],
  );
}

// Temporary placeholder until screens are implemented
class PlaceholderScreen extends StatelessWidget {
  final String title;
  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(child: Text('Screen: $title')),
    );
  }
}
