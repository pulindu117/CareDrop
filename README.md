# CareDrop 🏥

CareDrop is a hospital logistics platform that connects patients or guardians with trusted Community Assistants who handle non-clinical hospital errands. The platform allows users to request tasks such as medicine pickup, lab report collection, queue assistance, food delivery, and essential item delivery.

## 🚀 Features

The application currently implements a complete **Patient / Guardian vertical slice**, encompassing the following flows:

*   **Authentication & Onboarding**: Role selection, onboarding tutorials, and a complete auth flow (Registration, Phone/Email Verification, Login, Forgot Password, and Profile Setup).
*   **Request Creation Funnel**: A step-by-step intuitive process for creating tasks:
    *   Category selection (Medicine, Lab Reports, Queue, Food, Essentials, Other)
    *   Task detail entry
    *   Hospital search and selection
    *   Date & Time scheduling (ASAP or later)
    *   Location picking
    *   Prescription / Document upload
    *   Final review and submission
*   **Matching & Active Tracking**: Real-time simulation of matching with a verified Community Assistant, viewing their trust profile/ratings, and tracking task completion status through a dynamic timeline.

## 🛠️ Tech Stack & Architecture

*   **Framework**: Flutter & Dart (Targeting Android)
*   **Navigation**: `go_router` for robust declarative routing and deep linking.
*   **Theming**: Custom Material 3 Dark Theme built directly from Google Stitch designs.
*   **Architecture**: Feature-first module structure.
*   **Services**: Abstracted service layers (`AuthService`, `RequestService`) with simulated mocks, ready for future Firebase / Google Maps / Stripe integrations.

## 📁 Project Structure

```text
lib/
├── core/
│   ├── routing/        # GoRouter configuration & route names
│   └── theme/          # CareDrop M3 dark theme, colors, and typography (Inter)
├── models/             # Domain models (User, TaskRequest, Hospital, Assistant)
├── services/           # Service abstractions & mock implementations
├── widgets/            # Reusable UI components (Buttons, Inputs, Cards, AppBars)
└── features/
    ├── splash/         # Splash screen
    ├── onboarding/     # Role selection and app introduction
    ├── auth/           # Login, registration, and verifications
    ├── profile/        # Profile setup and management
    ├── home/           # Main dashboard and active tasks
    ├── requests/       # Step-by-step task creation funnel
    └── matching/       # Assistant matching and live task tracking
```

## 🎨 Design System

CareDrop implements a strict, custom design system extracted from Google Stitch:
*   **Palette**: Dark charcoal backgrounds (`#131313`) elevated by "Glass Card" panels (`#1E1E1E`), accented with CareDrop Gold (`#f7bf62`) and Cyan (`#5de6ff`).
*   **Typography**: Clean, readable Google Inter font across 7 defined text styles.
*   **Components**: Consistent floating-label text fields, subtle button glint effects, and elevated bento-box style card layouts.

## 🏁 Getting Started

To run the project locally, ensure you have the [Flutter SDK](https://flutter.dev/docs/get-started/install) installed.

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/CareDrop.git
   cd CareDrop
   ```

2. **Install Dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the app**
   ```bash
   flutter run
   ```

*(Note: Currently runs entirely on mock data and local state. No API keys or backend configuration required for this prototype phase).*
