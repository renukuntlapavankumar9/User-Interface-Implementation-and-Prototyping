# FitPulse — Mobile App UI Prototype (Week 2 Internship Submission)

FitPulse is a modern, modular Flutter mobile application prototype developed to translate Week 1 wireframes and UX architecture into functional, clean front-end code.

---

## 🏗️ Project Architecture & File Structure

The project follows a **Feature-First Architecture** to isolate business domains, improve maintainability, and ensure clean separation of concerns:

```text
fitpulse_app/
├── lib/
│   ├── main.dart                          # Application entry point & theme initialization
│   ├── core/
│   │   ├── constants/
│   │   │   └── app_colors.dart            # Centralized UI color tokens & status palettes
│   │   └── theme/
│   │       └── app_theme.dart             # App-wide Material 3 theme configuration
│   ├── navigation/
│   │   └── main_navigation_shell.dart     # Persistent BottomNavigationBar via IndexedStack
│   └── features/
│       ├── dashboard/
│       │   └── dashboard_screen.dart      # Progress rings, habit cards, quick start CTA
│       ├── workout/
│       │   └── workout_tracker_screen.dart# Active timers & interactive set/rep loggers
│       ├── habits/
│       │   └── habit_log_screen.dart      # Calendar strip & toggleable checklist
│       ├── analytics/
│       │   └── analytics_screen.dart      # Volume bar charts & metrics summary grid
│       └── profile/
│           └── profile_screen.dart        # User goals, preferences & settings list
├── screenshots/                           # High-res running app screen captures
│   ├── 01_dashboard.png
│   ├── 02_workout_tracker.png
│   ├── 03_habit_log.png
│   ├── 04_analytics.png
│   └── 05_profile.png
├── pubspec.yaml
└── README.md
```

---

## 🎨 Design Decisions & UI Implementation

- **State Preservation via IndexedStack:** The main navigation shell uses `IndexedStack` to keep all 5 primary screen states alive in memory, ensuring instant tab switching without re-rendering or losing timer and input states.
- **Ergonomic Call-To-Actions (CTAs):** Key interaction buttons (e.g., `START TODAY'S WORKOUT`, `LOG COMPLETED SET`) use full-width designs located in the lower third of the display for comfortable thumb accessibility.
- **Material 3 Design Consistency:** Structured around clean surface colors (`#FFFFFF`), light border outlines (`#E2E8F0`), and a primary deep blue palette (`#1E3A8A`) paired with vivid electric blue accents (`#3B82F6`) and emerald success indicators (`#10B981`).
- **Interactive UI Components:**
  - **Dashboard:** Interactive habit check-off with feedback snackbars, quick-log hydration counters, daily calorie progress ring with rounded caps, and scheduled workout launch card.
  - **Active Workout:** Live stopwatch timer with pause/resume controls, exercise form cue sheet modal, dynamic set list with add-set functionality, and recommended rest timer badge.
  - **Habit Tracker:** Dynamic 7-day calendar strip, daily consistency score progress bar, filter chips (All, Pending, Completed), streak flame counters, and modal bottom sheet to create custom habits.
  - **Analytics:** Period segmented tabs (Week, Month, Year), responsive volume lifted bar chart with day highlights, comprehensive 2x2 metric cards with percentage trends, and personal record (PR) badges.
  - **Profile:** Athlete biometrics summary, target weight progress tracker, real switch toggles for device integrations (Google Fit, haptics, daily alerts), and a confirmation logout dialog.

---

## ⚙️ Setup & Execution Instructions

### Prerequisites
- **Flutter SDK** (Version >= 3.0.0)
- **Dart SDK** (Version >= 3.0.0)
- **Android Studio / VS Code** configured with Flutter & Dart extensions
- Connected physical device (e.g., `TECNO LH8n`) or an Android / iOS emulator

### Running the App Locally

1. **Navigate to Project Directory:**
   ```powershell
   cd C:\Projects\Yuvaintern\fitpulse_app
   ```

2. **Fetch Dependencies:**
   ```powershell
   flutter pub get
   ```

3. **Verify Static Analysis:**
   ```powershell
   flutter analyze
   ```

4. **Run Application on Connected Device/Emulator:**
   ```powershell
   flutter run
   ```

---

## 📱 Screenshots (Running on Device: TECNO LH8n)

All 5 core running screens were captured directly from the physical Android device (`TECNO LH8n`, 1080×2460) and saved in the `/screenshots` directory:

| Screen | File | Key Features Displayed |
| :--- | :--- | :--- |
| **01. Dashboard** | `screenshots/01_dashboard.png` | Goal progress ring (77%), scheduled workout hero card, quick-log hydration & weight actions, habit checklist |
| **02. Active Workout** | `screenshots/02_workout_tracker.png` | Live stopwatch timer (00:27:27), exercise hero card with form cues, interactive set/rep rows, rest timer pill, full-width CTA |
| **03. Habit Tracker** | `screenshots/03_habit_log.png` | Interactive weekly day strip (Mon-Sun), daily consistency score bar, filter chips, habit streak flame badges, New Habit FAB |
| **04. Analytics** | `screenshots/04_analytics.png` | Week/Month/Year period filter, volume lifted custom bar chart with day tooltips, 2x2 metric cards (+12.4% trend), PR badges |
| **05. Profile & Settings** | `screenshots/05_profile.png` | Athlete profile header, lean bulk target progress bar, categorized settings, real preference switch controls, logout modal |

---

## 🏆 Week 2 Internship Submission Summary

- **Codebase:** Feature-First modular Flutter architecture with 0 compilation errors and clean static analysis (`flutter analyze` passing with no issues).
- **Screens Implemented:** 5 complete screens with interactive components and Material 3 design tokens.
- **Testing & Verification:** Successfully compiled and validated on physical Android device (`TECNO LH8n`).
- **Deliverables:** High-res screenshots in `/screenshots`, professional `README.md`, and clean `.zip` archive.