import 'package:flutter/material.dart';
import 'package:gp/core/helper/images.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/core/theme/styles.dart';

class OnboardAppBar extends StatelessWidget {
  const OnboardAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryblueColor,
      toolbarHeight: 63,
      title: Padding(
        padding: const EdgeInsets.only(left: 110),
        child: Row(
          children: [
            Image.asset(Images.secureIcon, width: 16, height: 20),
            SizedBox(width: 8),
            Text(
              "DriveSecureX",
              style: Styles.inter18bold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 19),
          child: Text(
            "Skip",
            style: Styles.inter14medium.copyWith(color: Color(0xff9CA3AF)),
          ),
        ),
      ],
    );
  }
}
