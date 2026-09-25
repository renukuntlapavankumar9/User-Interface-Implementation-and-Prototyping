import 'package:flutter/material.dart';

/// Centralized Color Palette for FitPulse UI consistency
/// Material 3 Design Tokens tailored for high-contrast fitness tracking
class AppColors {
  // Core Brand Colors
  static const Color primary = Color(0xFF1E3A8A); // Deep Navy Blue
  static const Color primaryDark = Color(0xFF0F172A); // Rich Slate Blue
  static const Color primaryLight = Color(0xFFEFF6FF); // Soft Tint Blue
  static const Color accent = Color(0xFF3B82F6); // Vivid Electric Blue
  static const Color accentDark = Color(0xFF2563EB); // Deep Royal Blue

  // Surfaces & Backgrounds
  static const Color background = Color(0xFFF8FAFC); // Off-white Slate
  static const Color surface = Color(0xFFFFFFFF); // Pure Crisp White
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardSubtle = Color(0xFFF1F5F9); // Slate 100

  // Typography Colors
  static const Color textPrimary = Color(0xFF0F172A); // Deep Charcoal
  static const Color textSecondary = Color(0xFF64748B); // Muted Slate Grey
  static const Color textMuted = Color(0xFF94A3B8); // Subdued Light Slate

  // Structural & Dividers
  static const Color border = Color(0xFFE2E8F0); // Light Crisp Border
  static const Color divider = Color(0xFFF1F5F9);

  // Status & Metric Highlights
  static const Color success = Color(0xFF10B981); // Emerald Green
  static const Color successLight = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFF59E0B); // Amber Alert
  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color energyOrange = Color(
    0xFFF97316,
  ); // Energetic Calorie Flame
  static const Color energyLight = Color(0xFFFFF7ED);
  static const Color purple = Color(0xFF8B5CF6); // Recovery Purple
  static const Color purpleLight = Color(0xFFF5F3FF);
  static const Color error = Color(0xFFEF4444); // Crimson Red
  static const Color errorLight = Color(0xFFFEF2F2);
}
