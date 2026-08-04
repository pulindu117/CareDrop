import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle get _base => GoogleFonts.inter(
        color: AppColors.onSurface,
      );

  static TextStyle get displayLg => _base.copyWith(
        fontSize: 48,
        fontWeight: FontWeight.w700,
        height: 56 / 48,
        letterSpacing: -0.02 * 48,
      );

  static TextStyle get headlineLg => _base.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w700,
        height: 40 / 32,
        letterSpacing: -0.01 * 32,
      );

  static TextStyle get headlineLgMobile => _base.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 32 / 24,
      );

  static TextStyle get titleMd => _base.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 28 / 20,
      );

  static TextStyle get bodyLg => _base.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
      );

  static TextStyle get bodyMd => _base.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
      );

  static TextStyle get labelMd => _base.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
        letterSpacing: 0.05 * 12,
      );
}
