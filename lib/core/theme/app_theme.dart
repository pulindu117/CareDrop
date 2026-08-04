import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: const ColorScheme.dark(
        primary: AppColors.primary,
        primaryContainer: AppColors.primaryContainer,
        onPrimary: AppColors.onPrimary,
        onPrimaryContainer: AppColors.onPrimaryContainer,
        secondary: AppColors.secondary,
        secondaryContainer: AppColors.secondaryContainer,
        onSecondary: AppColors.onSecondary,
        tertiary: AppColors.tertiary,
        tertiaryContainer: AppColors.tertiaryContainer,
        background: AppColors.background,
        onBackground: AppColors.onBackground,
        surface: AppColors.surface,
        onSurface: AppColors.onSurface,
        onSurfaceVariant: AppColors.onSurfaceVariant,
        outline: AppColors.outline,
        outlineVariant: AppColors.outlineVariant,
        error: AppColors.error,
        errorContainer: AppColors.errorContainer,
        onError: AppColors.onError,
      ),
      scaffoldBackgroundColor: AppColors.background,
      textTheme: TextTheme(
        displayLarge: AppTextStyles.displayLg,
        headlineLarge: AppTextStyles.headlineLg,
        headlineMedium: AppTextStyles.headlineLgMobile,
        titleMedium: AppTextStyles.titleMd,
        bodyLarge: AppTextStyles.bodyLg,
        bodyMedium: AppTextStyles.bodyMd,
        labelMedium: AppTextStyles.labelMd,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.surface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTextStyles.headlineLgMobile.copyWith(
          color: AppColors.primary,
        ),
        iconTheme: const IconThemeData(color: AppColors.onSurfaceVariant),
      ),
    );
  }
}
