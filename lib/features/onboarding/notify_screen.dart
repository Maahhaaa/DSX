import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dsx/core/helper/images.dart';
import 'package:dsx/core/theme/app_colors.dart';
import 'package:dsx/core/theme/glow_effect.dart';
import 'package:dsx/core/theme/styles.dart';
import 'package:dsx/features/onboarding/widgets/custom_button.dart';

class NotifyScreen extends StatelessWidget {
  const NotifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GlowEffect(),
              Image.asset(
                Images.alretImage,
                width: 350.w,
                height: 374.h,
                alignment: Alignment.center,
              ),
            ],
          ),
          Text(
            "Never Miss a Beat",
            style: Styles.inter32bold.copyWith(color: Colors.white),
          ),
          SizedBox(height: 12.h),
          SizedBox(
            width: 320.w,
            child: Text(
              "Our advanced sensors communicate directly with your phone. Whether it's a window break or a forced entry, you'll know instantly.",
              style: Styles.inter16medium.copyWith(color: AppColors.greyColor),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 14.h),

          CustomButton(text: "Finish Setup", onPressed: () {}),
        ],
      ),
    );
  }
}
