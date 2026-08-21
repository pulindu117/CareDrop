import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/routing/route_names.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final AnimationController _pulseController;

  late final Animation<double> _fadeAnimation;
  late final Animation<Offset> _slideAnimation;
  late final Animation<double> _pulseAnimation;
  late final Animation<double> _glowScaleAnimation;
  late final Animation<double> _glowOpacityAnimation;

  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();

    // ------------------------------------------------------------
    // Fade + slide animation for the whole splash content.
    // ------------------------------------------------------------
    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeOutCubic,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.08),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.easeOutCubic,
      ),
    );

    _fadeController.forward();

    // ------------------------------------------------------------
    // Main breathing glow animation.
    //
    // One continuous controller drives:
    // 1. glow size
    // 2. glow opacity
    // 3. logo glow intensity
    //
    // This keeps the effect synchronized and smooth.
    // ------------------------------------------------------------
    _pulseController = AnimationController(
      duration: const Duration(milliseconds: 2200),
      vsync: this,
    );

    final curvedPulse = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOutSine,
    );

    _pulseAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(curvedPulse);

    _glowScaleAnimation = Tween<double>(
      begin: 0.88,
      end: 1.08,
    ).animate(curvedPulse);

    _glowOpacityAnimation = Tween<double>(
      begin: 0.04,
      end: 0.16,
    ).animate(curvedPulse);

    _pulseController.repeat(reverse: true);

    // Navigate after 5 seconds.
    _navigationTimer = Timer(
      const Duration(seconds: 5),
      () {
        if (!mounted) return;
        context.go(RouteNames.roleSelection);
      },
    );
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    _fadeController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // ==========================================================
          // AMBIENT GLOW
          // ==========================================================
          //
          // RadialGradient gives us a completely symmetrical glow.
          // Unlike a large BoxShadow, it does not create a directional
          // or "left/right" looking shadow.
          //
          Align(
            alignment: Alignment.center,
            child: AnimatedBuilder(
              animation: _pulseAnimation,
              builder: (context, child) {
                final glowSize = size.width * 0.72 * _glowScaleAnimation.value;
                final glowOpacity = _glowOpacityAnimation.value;

                return IgnorePointer(
                  child: SizedBox(
                    width: glowSize,
                    height: glowSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          center: Alignment.center,
                          radius: 0.5,
                          colors: [
                            AppColors.primaryContainer.withValues(
                              alpha: glowOpacity,
                            ),
                            AppColors.primaryContainer.withValues(
                              alpha: glowOpacity * 0.55,
                            ),
                            AppColors.primaryContainer.withValues(
                              alpha: glowOpacity * 0.15,
                            ),
                            Colors.transparent,
                          ],
                          stops: const [
                            0.0,
                            0.35,
                            0.68,
                            1.0,
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // ==========================================================
          // MAIN CONTENT
          // ==========================================================
          SafeArea(
            child: FadeTransition(
              opacity: _fadeAnimation,
              child: SlideTransition(
                position: _slideAnimation,
                child: Column(
                  children: [
                    const Spacer(),

                    // ====================================================
                    // LOGO
                    // ====================================================
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        final pulse = _pulseAnimation.value;

                        return Container(
                          width: 110,
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.surfaceContainer,
                            border: Border.all(
                              color: AppColors.outlineVariant,
                            ),
                            boxShadow: [
                              // Static depth shadow.
                              BoxShadow(
                                color: Colors.black.withValues(
                                  alpha: 0.40,
                                ),
                                blurRadius: 32,
                                spreadRadius: 0,
                                offset: const Offset(0, 8),
                              ),

                              // Symmetrical amber glow.
                              BoxShadow(
                                color: AppColors.primaryContainer.withValues(
                                  alpha: 0.10 + (0.20 * pulse),
                                ),
                                blurRadius: 24 + (18 * pulse),
                                spreadRadius: 2 + (4 * pulse),
                              ),
                            ],
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Icon(
                                Icons.water_drop,
                                size: 64,
                                color: AppColors.primaryContainer.withValues(
                                  alpha: 0.72 + (0.28 * pulse),
                                ),
                              ),
                              Icon(
                                Icons.favorite,
                                size: 28,
                                color: AppColors.onSurface.withValues(
                                  alpha: 0.85,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 32),

                    // ====================================================
                    // BRAND
                    // ====================================================
                    Text(
                      'CareDrop',
                      style: AppTextStyles.displayLg.copyWith(
                        color: AppColors.primary,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Text(
                      'Hospital logistics, handled with care.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.bodyLg.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),

                    const Spacer(),

                    // ====================================================
                    // INITIALIZING INDICATOR
                    // ====================================================
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.surfaceContainerLow,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.outlineVariant,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedBuilder(
                            animation: _pulseAnimation,
                            builder: (context, child) {
                              final pulse = _pulseAnimation.value;

                              return Row(
                                children: List.generate(
                                  3,
                                  (index) {
                                    final phase = (pulse + (index * 0.18))
                                        .clamp(0.0, 1.0);

                                    return AnimatedContainer(
                                      duration: const Duration(
                                        milliseconds: 180,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 3,
                                      ),
                                      width: 8,
                                      height: 8,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.primaryContainer
                                            .withValues(
                                          alpha: 0.35 + (0.65 * phase),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'INITIALIZING',
                            style: AppTextStyles.labelMd.copyWith(
                              color: AppColors.onSurfaceVariant,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}