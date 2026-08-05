# CareDrop Implementation Tasks

## Phase 1: Project Setup + Theme + Navigation
- `[x]` Initialize Flutter project at `e:\coding\github\CareDrop`
- `[x]` Configure `pubspec.yaml` (google_fonts, go_router, flutter_svg)
- `[x]` Create `lib/core/theme/app_colors.dart`
- `[x]` Create `lib/core/theme/app_text_styles.dart`
- `[x]` Create `lib/core/theme/app_theme.dart`
- `[x]` Create `lib/core/routing/route_names.dart`
- `[x]` Create `lib/core/routing/app_router.dart`
- `[x]` Update `main.dart` and `app.dart`

## Phase 2: Reusable Widgets
- `[x]` `caredrop_button.dart`
- `[x]` `caredrop_text_field.dart`
- `[x]` `caredrop_card.dart`
- `[x]` `caredrop_app_bar.dart`
- `[x]` `caredrop_progress_bar.dart`
- `[x]` `caredrop_otp_field.dart`
- `[x]` `caredrop_bottom_nav.dart`

## Phase 3: Models + Services
- `[x]` Define Enums (`UserRole`, `TaskCategory`, `TaskStatus`)
- `[x]` Define Models (`User`, `TaskRequest`, `Hospital`, `CommunityAssistant`)
- `[x]` Create `AuthService` (interface + mock)
- `[x]` Create `RequestService` (interface + mock)

## Phase 4: Screens (Splash & Onboarding)
- `[x]` Splash Screen
- `[x]` Role Selection Screen
- `[x]` Onboarding Intro Screen
- `[x]` Onboarding Services Screen

## Phase 5: Screens (Auth & Profile)
- `[x]` Registration Screen
- `[x]` Phone Verification Screen
- `[x]` Email Verification Screen
- `[x]` Login Screen
- `[x]` Forgot Password Screen
- `[x]` Profile Setup Screen

## Phase 6: Screens (Home & Requests)
- `[x]` Home Screen
- `[x]` Select Category Screen
- `[x]` Task Details Screen
- `[x]` Hospital Info Screen
- `[x]` Date/Time Screen
- `[x]` Task Location Screen
- `[x]` Prescription Upload Screen
- `[x]` Review Request Screen
- `[x]` Request Submitted Screen

## Phase 7: Screens (Matching & Tracking)
- `[x]` Finding Assistant Screen
- `[x]` Assistant Found Screen
- `[x]` Assistant Profile Screen
- `[x]` Active Task Tracking Screen
- `[x]` Confirm Completion Screen

## Phase 8: Stabilization, Testing, and UI Refinement
- `[x]` Run flutter analyze and fix compile/runtime errors
- `[x]` Run flutter test (no test directory found)
- `[x]` Verify and improve UI accuracy (colors, spacing, typography) against Stitch design
- `[x]` Fix code quality issues (deprecated APIs, unused imports)
