# Navigation Fix Implementation Plan

The purpose of this plan is to correct the navigation behavior in the Flutter CareDrop app. Currently, several screens use `context.go()` instead of `context.push()`, replacing the navigation stack and causing the Android system back button to exit the app instead of returning to the previous screen.

## Root Cause Analysis

In `go_router`, calling `context.go()` updates the router's current location and resets/replaces the navigation stack to match the target route. When screens along a multi-step user flow use `context.go()`, previous routes are wiped from the navigation stack. Consequently, pressing the Android back button on these screens treats the screen as the root and exits the app.

`context.push()` pushes a new route onto the existing navigation stack, preserving navigation history so that back button navigation (`context.pop()`) works naturally.

### Problematic Navigation Calls Identified

1. **`lib/features/auth/login_screen.dart` (Line 138)**:
   - *Current*: Tapping "Create an account" calls `context.go(RouteNames.register)`.
   - *Issue*: Wipes `LoginScreen` from the stack, so pressing back on `RegistrationScreen` exits the app instead of returning to `LoginScreen`.
   - *Fix*: Change to `context.push(RouteNames.register)`.

2. **`lib/features/auth/registration_screen.dart` (Line 117)**:
   - *Current*: Tapping "Log In" calls `context.go(RouteNames.login)`.
   - *Issue*: Wipes the stack when returning to login.
   - *Fix*: Change to `context.pop()` (or `context.push(RouteNames.login)` if unable to pop).

3. **`lib/features/auth/email_verification_screen.dart` (Line 24)**:
   - *Current*: Completing email verification calls `context.go(RouteNames.profileSetup)`.
   - *Issue*: Wipes the registration flow history prior to profile setup.
   - *Fix*: Change to `context.push(RouteNames.profileSetup)`.

4. **`lib/features/requests/request_submitted_screen.dart` (Line 42)**:
   - *Current*: Tapping "View Status" calls `context.go(RouteNames.findingAssistant)`.
   - *Issue*: Wipes all task request wizard history (`Home` -> `Select Category` -> ... -> `Review Request` -> `Request Submitted`), making `FindingAssistantScreen` the root.
   - *Fix*: Change to `context.push(RouteNames.findingAssistant)`.

5. **`lib/features/matching/finding_assistant_screen.dart` (Line 38)**:
   - *Current*: `context.pushReplacement(RouteNames.assistantFound)`.
   - *Fix*: Change to `context.push(RouteNames.assistantFound)` to maintain back stack integrity across the request flow.

6. **`lib/features/matching/assistant_found_screen.dart` (Line 129)**:
   - *Current*: Tapping "Confirm Assistant" calls `context.go(RouteNames.activeTracking)`.
   - *Issue*: Wipes stack history before entering active tracking.
   - *Fix*: Change to `context.push(RouteNames.activeTracking)`.

### Correct Usage of `context.go()` (Retained as intentional resets)
- `SplashScreen` -> `RoleSelectionScreen` (`context.go` - splash shouldn't be returnable).
- `OnboardingServicesScreen` -> `LoginScreen` (`context.go` - end of onboarding flow).
- `LoginScreen` -> `HomeScreen` (`context.go` - authentication complete, home is new root).
- `ProfileSetupScreen` -> `HomeScreen` (`context.go` - registration/profile setup complete).
- `ConfirmCompletionScreen` -> `HomeScreen` (`context.go` - task completed).
- `AssistantFoundScreen` (Cancel Request) -> `HomeScreen` (`context.go` - task cancelled).

## Proposed Changes

### Authentication & Profile Flow

#### [MODIFY] [login_screen.dart](file:///e:/coding/github/CareDrop/lib/features/auth/login_screen.dart)
- Replace `context.go(RouteNames.register)` with `context.push(RouteNames.register)`.

#### [MODIFY] [registration_screen.dart](file:///e:/coding/github/CareDrop/lib/features/auth/registration_screen.dart)
- Replace `context.go(RouteNames.login)` with `context.pop()` (or fallback to `context.push(RouteNames.login)` if `context.canPop()` is false).

#### [MODIFY] [email_verification_screen.dart](file:///e:/coding/github/CareDrop/lib/features/auth/email_verification_screen.dart)
- Replace `context.go(RouteNames.profileSetup)` with `context.push(RouteNames.profileSetup)`.

---

### Task Request & Matching Flow

#### [MODIFY] [request_submitted_screen.dart](file:///e:/coding/github/CareDrop/lib/features/requests/request_submitted_screen.dart)
- Replace `context.go(RouteNames.findingAssistant)` with `context.push(RouteNames.findingAssistant)`.

#### [MODIFY] [finding_assistant_screen.dart](file:///e:/coding/github/CareDrop/lib/features/matching/finding_assistant_screen.dart)
- Replace `context.pushReplacement(RouteNames.assistantFound)` with `context.push(RouteNames.assistantFound)`.

#### [MODIFY] [assistant_found_screen.dart](file:///e:/coding/github/CareDrop/lib/features/matching/assistant_found_screen.dart)
- Replace `context.go(RouteNames.activeTracking)` with `context.push(RouteNames.activeTracking)`.

## Verification Plan

### Automated Tests
- Run `flutter analyze` via `run_command` in `e:\coding\github\CareDrop` to ensure zero static analysis errors or warnings.

### Manual Verification
- Trace route transitions mentally and via code inspection to confirm that all step-by-step navigation flows preserve navigation history while final completion steps reset to `HomeScreen`.
