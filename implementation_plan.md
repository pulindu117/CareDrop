# CareDrop Flutter Application — Implementation Plan

## Overview

Transform 25 Google Stitch design screens into a production-quality Flutter application for Android. The app is a hospital logistics platform connecting patients/guardians with Community Assistants for non-clinical errands (medicine pickup, lab reports, queue assistance, food/item delivery).

---

## Design System Analysis

The Stitch designs use a **Material 3 dark theme** with a consistent, extracted design language:

### Color Palette (Dark Mode — Primary)
| Token | Hex | Usage |
|---|---|---|
| `background` / `surface` | `#131313` | App background |
| `surfaceContainerLowest` | `#0e0e0e` | Deepest elevation |
| `surfaceContainerLow` | `#1c1b1b` | Low elevation cards |
| `surfaceContainer` | `#201f1f` | Mid-elevation containers |
| `surfaceContainerHigh` | `#2a2a2a` | Elevated cards, icons |
| `surfaceContainerHighest` | `#353534` | Chips, badges |
| `surfaceBright` | `#393939` | Active segmented control |
| `primary` | `#f7bf62` | Brand gold, headlines, accents |
| `primaryContainer` | `#d9a44a` | CTA buttons, badges |
| `onPrimaryContainer` | `#583b00` | Text on primary container |
| `onPrimary` | `#432c00` | Text on primary |
| `secondary` | `#5de6ff` | Cyan accent, live status |
| `secondaryContainer` | `#00cbe6` | Active task icons |
| `tertiary` | `#51e0a5` | Success, completion |
| `tertiaryContainer` | `#29c48b` | Completed badges |
| `error` | `#ffb4ab` | Error text |
| `errorContainer` | `#93000a` | Error backgrounds |
| `onSurface` | `#e5e2e1` | Primary text |
| `onSurfaceVariant` | `#d3c4b1` | Secondary/muted text |
| `outline` | `#9c8f7e` | Input borders |
| `outlineVariant` | `#4f4537` | Subtle borders |
| Card BG (custom) | `#1E1E1E` | Elevated card panels |
| Card Border (custom) | `#2C2C2C` | Card borders |
| Input BG (custom) | `#181818` | Text field backgrounds |

### Typography (Inter font family)
| Style | Size | Weight | Line Height | Letter Spacing |
|---|---|---|---|---|
| `displayLg` | 48px | 700 | 56px | -0.02em |
| `headlineLg` | 32px | 700 | 40px | -0.01em |
| `headlineLgMobile` | 24px | 700 | 32px | — |
| `titleMd` | 20px | 600 | 28px | — |
| `bodyLg` | 16px | 400 | 24px | — |
| `bodyMd` | 14px | 400 | 20px | — |
| `labelMd` | 12px | 600 | 16px | 0.05em |

### Component Patterns (from Stitch)
- **Buttons**: `bg-primary-container`, rounded-lg/xl/full, with top `h-[1px] bg-white/10` "glint" effect
- **Cards**: `bg-[#1E1E1E] border border-[#2C2C2C] rounded-xl`, with subtle shadow
- **Inputs**: `bg-[#181818]` with `border-b-2 border-outline-variant`, floating labels
- **Progress**: Step lines with `bg-primary` filled vs `bg-surface-container-highest` empty
- **Bottom Nav**: 5 items (Home, Requests, Create [elevated], Messages, Profile)
- **Chips/Badges**: `bg-surface-container-highest rounded-full px-3 py-1`
- **Material Symbols Outlined** icons throughout (filled variant for emphasis)

---

## Proposed Flutter Architecture

```
lib/
├── main.dart
├── app.dart
│
├── core/
│   ├── theme/
│   │   ├── app_colors.dart          # CareDrop color palette
│   │   ├── app_text_styles.dart      # Typography definitions
│   │   └── app_theme.dart            # ThemeData assembly
│   ├── constants/
│   │   └── app_constants.dart        # Spacing, sizing, strings
│   ├── routing/
│   │   ├── app_router.dart           # Route definitions
│   │   └── route_names.dart          # Named route constants
│   └── utils/
│       └── mock_delay.dart           # Simulate async operations
│
├── models/
│   ├── user_model.dart               # User data model
│   ├── user_role.dart                # Enum: Patient, Guardian, etc.
│   ├── task_request.dart             # Request/task domain model
│   ├── task_category.dart            # Enum: MedicinePickup, etc.
│   ├── task_status.dart              # Enum: Requested, Matching, etc.
│   ├── hospital.dart                 # Hospital model
│   └── community_assistant.dart      # Assistant profile model
│
├── services/
│   ├── auth_service.dart             # Auth interface + mock
│   └── request_service.dart          # Request/task interface + mock
│
├── widgets/
│   ├── caredrop_button.dart          # Primary/secondary/ghost buttons
│   ├── caredrop_text_field.dart      # Styled input with icon + label
│   ├── caredrop_card.dart            # Standard dark card container
│   ├── caredrop_app_bar.dart         # App bar variants
│   ├── caredrop_bottom_nav.dart      # Bottom navigation bar
│   ├── caredrop_progress_bar.dart    # Step progress indicators
│   ├── caredrop_status_chip.dart     # Status badge/chip
│   ├── caredrop_otp_field.dart       # OTP input boxes
│   ├── caredrop_role_card.dart       # Role selection card
│   ├── caredrop_task_card.dart       # Task category card
│   └── caredrop_loading_indicator.dart # Loading states
│
├── features/
│   ├── splash/
│   │   └── splash_screen.dart
│   │
│   ├── onboarding/
│   │   ├── role_selection_screen.dart
│   │   ├── onboarding_intro_screen.dart
│   │   └── onboarding_services_screen.dart
│   │
│   ├── auth/
│   │   ├── registration_screen.dart
│   │   ├── login_screen.dart
│   │   ├── phone_verification_screen.dart
│   │   ├── email_verification_screen.dart
│   │   └── forgot_password_screen.dart
│   │
│   ├── profile/
│   │   └── profile_setup_screen.dart
│   │
│   ├── home/
│   │   └── home_screen.dart
│   │
│   ├── requests/
│   │   ├── select_category_screen.dart
│   │   ├── task_details_screen.dart
│   │   ├── hospital_info_screen.dart
│   │   ├── date_time_screen.dart
│   │   ├── task_location_screen.dart
│   │   ├── prescription_upload_screen.dart
│   │   ├── review_request_screen.dart
│   │   └── request_submitted_screen.dart
│   │
│   └── matching/
│       ├── finding_assistant_screen.dart
│       ├── assistant_found_screen.dart
│       ├── assistant_profile_screen.dart
│       ├── active_task_tracking_screen.dart
│       └── confirm_completion_screen.dart
```

### Key Architectural Decisions

1. **State Management**: Flutter's built-in `StatefulWidget` + `ChangeNotifier` for this initial phase. No over-engineering with Bloc/Riverpod until the app warrants it. Service abstractions make future migration easy.

2. **Navigation**: `Navigator 2.0` via `MaterialApp.router` with `GoRouter` for declarative, scalable routing with route guards.

3. **Service Layer**: Abstract interfaces (`AuthService`, `RequestService`) with mock implementations. Firebase swapped in later.

4. **Mock Data**: Centralized in `services/` with clearly marked `// MOCK:` comments. Realistic data per spec (Kasun Perera → Marcus Lee per designs).

---

## Proposed Changes

### Phase 1: Project Setup + Theme + Navigation

#### [NEW] Flutter project initialization
- Create Flutter project at `e:\coding\github\CareDrop` (project root)
- Configure `pubspec.yaml` with dependencies: `google_fonts`, `go_router`, `flutter_svg`
- Set up Android configuration for minimum SDK 21+

#### [NEW] [app_colors.dart](file:///e:/coding/github/CareDrop/lib/core/theme/app_colors.dart)
Extract the complete M3 dark color palette from Stitch designs.

#### [NEW] [app_text_styles.dart](file:///e:/coding/github/CareDrop/lib/core/theme/app_text_styles.dart)
Define all 7 typography styles using Inter font.

#### [NEW] [app_theme.dart](file:///e:/coding/github/CareDrop/lib/core/theme/app_theme.dart)
Assemble `ThemeData` with dark ColorScheme, typography, button/input/card themes.

#### [NEW] [app_router.dart](file:///e:/coding/github/CareDrop/lib/core/routing/app_router.dart)
Define all routes with GoRouter, including auth flow guards.

---

### Phase 2: Reusable Widgets (7 core components)

#### [NEW] `caredrop_button.dart` — Primary (gold), outlined, ghost variants with glint effect
#### [NEW] `caredrop_text_field.dart` — Dark input with leading icon, floating label, bottom border
#### [NEW] `caredrop_card.dart` — `#1E1E1E` card with `#2C2C2C` border
#### [NEW] `caredrop_app_bar.dart` — Variants: brand-only, back+brand, back+title+step
#### [NEW] `caredrop_progress_bar.dart` — Step dots and segmented step lines
#### [NEW] `caredrop_otp_field.dart` — 6-digit OTP input with auto-focus
#### [NEW] `caredrop_bottom_nav.dart` — 5-tab nav with elevated center "Create" button

---

### Phase 3: Models + Services

#### [NEW] All models in `lib/models/`
- `UserRole` enum (patient, guardian, communityAssistant, admin)
- `TaskCategory` enum (medicinePickup, labReport, queueAssistance, foodDelivery, essentialItems, other)
- `TaskStatus` enum (12 statuses from spec)
- `TaskRequest` model with all fields from spec
- `Hospital`, `CommunityAssistant` models

#### [NEW] Mock services
- `MockAuthService` — simulated login/register with delays
- `MockRequestService` — mock task creation, assistant matching

---

### Phase 4: All 24 Screens (grouped by feature)

Implemented sequentially following the user journey:
1. Splash → Role Selection → Onboarding (2 screens)
2. Registration → Phone Verification → Email Verification → Login → Forgot Password
3. Profile Setup → Home
4. Select Category → Task Details → Hospital Info → Date/Time → Location → Prescription Upload → Review → Submit
5. Finding Assistant → Assistant Found → Assistant Profile → Active Tracking → Confirm Completion

Each screen faithfully reproduces the corresponding Stitch design's layout, colors, typography, icons, and interactions.

---

## Open Questions

> [!IMPORTANT]
> **GoRouter vs Navigator 1.0**: I plan to use `go_router` for clean declarative routing. This adds one dependency but significantly simplifies route guards and deep linking. Is this acceptable, or do you prefer vanilla `Navigator`?

> [!NOTE]
> **State Management**: For this initial phase, I'll use simple `StatefulWidget` + service injection. No heavy state management libraries. This keeps things understandable for a university student while remaining professional. Future phases can introduce Provider/Riverpod if needed.

> [!NOTE]
> **Mock Images**: The Stitch designs reference external Google image URLs for onboarding illustrations, profile photos, and map backgrounds. For the Flutter app, I'll use Material Icons and placeholder containers with the correct colors/sizes. Real images can be added later when assets are finalized.

---

## Verification Plan

### Build & Run
- `flutter analyze` — zero errors
- `flutter build apk --debug` — successful build
- Run on Android emulator and verify all 24 screens render

### Navigation Testing
- Walk through the complete user journey: Splash → ... → Confirm Completion
- Verify back navigation works correctly
- Verify auth flow prevents backward navigation to splash/onboarding after "completing" registration

### Visual Consistency
- Compare each Flutter screen against its Stitch HTML design
- Verify color palette, typography, spacing, and component patterns match
- Verify dark mode is consistently applied
