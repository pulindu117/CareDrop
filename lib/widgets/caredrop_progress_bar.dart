import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

enum ProgressBarVariant { segmentedLines, dots }

class CareDropProgressBar extends StatelessWidget {
  final int totalSteps;
  final int currentStep;
  final ProgressBarVariant variant;

  const CareDropProgressBar({
    super.key,
    required this.totalSteps,
    required this.currentStep,
    this.variant = ProgressBarVariant.segmentedLines,
  });

  @override
  Widget build(BuildContext context) {
    if (variant == ProgressBarVariant.dots) {
      return _buildDots();
    }
    return _buildSegmentedLines();
  }

  Widget _buildSegmentedLines() {
    return Row(
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;
        return Expanded(
          child: Container(
            height: 4,
            margin: EdgeInsets.only(
              left: index == 0 ? 0 : 4,
              right: index == totalSteps - 1 ? 0 : 4,
            ),
            decoration: BoxDecoration(
              color: isActive ? AppColors.primary : AppColors.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        );
      }),
    );
  }

  Widget _buildDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index == (currentStep - 1); // For dots usually it's current page
        return Container(
          width: isActive ? 32 : 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: isActive ? AppColors.primary : AppColors.surfaceContainerHigh,
            borderRadius: BorderRadius.circular(4),
            boxShadow: isActive
                ? [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.4),
                      blurRadius: 8,
                    )
                  ]
                : null,
          ),
        );
      }),
    );
  }
}
