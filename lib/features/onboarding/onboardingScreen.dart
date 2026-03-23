import 'package:flutter/material.dart';
import 'package:gp/core/helper/images.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/core/theme/glow_effect.dart';
import 'package:gp/core/theme/styles.dart';
import 'package:gp/features/onboarding/widgets/custom_button.dart';


class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          children: [
            Stack(children: [Image.asset(Images.carImage), GlowEffect()]),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                text: "Your Car's ",
                style: Styles.inter32bold.copyWith(color: Colors.white),
                children: [
                  TextSpan(
                    text: "Digital Shield",
                    style: TextStyle(color: AppColors.secondaryblueColor),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              width: 330,
              child: Text(
                "Monitor your vehicle's security status in real-time and get instant alerts the moment an attack is detected.",
                style: Styles.inter16medium.copyWith(
                  color: AppColors.greyColor,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 14),

            CustomButton(
              text: "Start Monitoring",
              onPressed: () {},
            ),

            SizedBox(height: 16),
            Text(
              "I already have an account",
              style: Styles.inter14medium.copyWith(color: AppColors.greyColor),
            ),
          ],
        ),
    );
  }
}
