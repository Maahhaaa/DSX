import 'package:flutter/material.dart';
import 'package:gp/core/theme/app_colors.dart';

class GlowEffect extends StatelessWidget {
  const GlowEffect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width:370,
      height: 370,
      decoration: BoxDecoration(
        color: AppColors.primaryblueColor,
        borderRadius: BorderRadius.circular(9999),
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 0.75,
          colors: [
            Color(0xFF1337EC).withValues(alpha: 0.2),
            Color.fromARGB(255, 19, 43, 164).withValues(alpha: 0.01),
            AppColors.primaryblueColor.withValues(alpha: 0.01),
          ],
          stops: [0.1,0.7, 1],
        ),
      ),
    );
  }
}