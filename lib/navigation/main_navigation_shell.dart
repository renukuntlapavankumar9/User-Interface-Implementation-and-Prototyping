import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../features/dashboard/dashboard_screen.dart';
import '../features/workout/workout_tracker_screen.dart';
import '../features/habits/habit_log_screen.dart';
import '../features/analytics/analytics_screen.dart';
import '../features/profile/profile_screen.dart';

/// Central Navigation Shell providing persistent BottomNavigationBar switching
/// Uses IndexedStack to preserve state across all 5 core feature screens
class MainNavigationShell extends StatefulWidget {
  const MainNavigationShell({super.key});

  /// Helper to allow child widgets to switch tabs programmatically
  static void navigateToTab(BuildContext context, int index) {
    final state = context.findAncestorStateOfType<_MainNavigationShellState>();
    state?.setTab(index);
  }

  @override
  State<MainNavigationShell> createState() => _MainNavigationShellState();
}

class _MainNavigationShellState extends State<MainNavigationShell> {
  int _currentIndex = 0;

  void setTab(int index) {
    if (index >= 0 && index < _screens.length) {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  late final List<Widget> _screens = [
    DashboardScreen(onStartWorkout: () => setTab(1)),
    const WorkoutTrackerScreen(),
    const HabitLogScreen(),
    const AnalyticsScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: _currentIndex, children: _screens),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.surface,
          border: Border(top: BorderSide(color: AppColors.border, width: 1.0)),
          boxShadow: [
            BoxShadow(
              color: Color(0x0A0F172A),
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: NavigationBar(
            selectedIndex: _currentIndex,
            onDestinationSelected: setTab,
            backgroundColor: AppColors.surface,
            surfaceTintColor: Colors.transparent,
            elevation: 0,
            indicatorColor: AppColors.primaryLight,
            destinations: const [
              NavigationDestination(
                icon: Icon(
                  Icons.space_dashboard_outlined,
                  color: AppColors.textSecondary,
                ),
                selectedIcon: Icon(
                  Icons.space_dashboard,
                  color: AppColors.primary,
                ),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.fitness_center_outlined,
                  color: AppColors.textSecondary,
                ),
                selectedIcon: Icon(
                  Icons.fitness_center,
                  color: AppColors.primary,
                ),
                label: 'Track',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.check_box_outlined,
                  color: AppColors.textSecondary,
                ),
                selectedIcon: Icon(Icons.check_box, color: AppColors.primary),
                label: 'Habits',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.bar_chart_outlined,
                  color: AppColors.textSecondary,
                ),
                selectedIcon: Icon(Icons.bar_chart, color: AppColors.primary),
                label: 'Stats',
              ),
              NavigationDestination(
                icon: Icon(
                  Icons.person_outline,
                  color: AppColors.textSecondary,
                ),
                selectedIcon: Icon(Icons.person, color: AppColors.primary),
                label: 'Profile',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
