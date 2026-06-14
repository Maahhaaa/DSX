import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/core/theme/styles.dart';
import 'package:gp/features/alrets/widget/alretcard.dart';

class Alrets extends StatefulWidget {
  const Alrets({super.key});

  @override
  State<Alrets> createState() => _AlretsState();
}

class _AlretsState extends State<Alrets> {
  final List<String> _filters = ["All", "Critical", "Warnings", "Info"];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryblueColor,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 110.h,
        backgroundColor: AppColors.medDarkblueColor,
        title: Text(
          "Alerts",
          style: Styles.inter18bold.copyWith(color: Colors.white),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(52.h),
          child: Padding(
            padding: EdgeInsets.only(left: 16.w, bottom: 18.h),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(_filters.length, (index) {
                  final bool isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: Container(
                      margin: EdgeInsets.only(right: 8.w),
                      padding: EdgeInsets.symmetric(
                        horizontal: 22.w,
                        vertical: 12.h,
                      ),
                      decoration: BoxDecoration(
                        color: isSelected
                            ? AppColors.secondaryblueColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(9999.r),
                        border: Border.all(
                          color: isSelected
                              ? AppColors.secondaryblueColor
                              : AppColors.greyColor.withValues(alpha: 0.4),
                          width: 1,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: Styles.inter14medium.copyWith(
                          color: isSelected
                              ? Colors.white
                              : AppColors.greyColor,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16.h),
                Text(
                  "TODAY",
                  style: Styles.inter16semi.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                AlertCard(
                  severity: AlertSeverity.critical,
                  title: "RED — Flooding Attack",
                  description:
                      "High frequency packet injection detected on CAN bus.",
                  timeAgo: "2 min ago",
                  onTap: () {
                    // navigate to alert details
                  },
                ),
                SizedBox(height: 28.h),
                Text(
                  "YESTERDAY",
                  style: Styles.inter16semi.copyWith(
                    color: AppColors.greyColor,
                    fontSize: 12.sp,
                  ),
                ),
                SizedBox(height: 12.h),
                AlertCard(
                  severity: AlertSeverity.warning,
                  title: "Unauthorized Access",
                  description:
                      "Failed authentication attempt on door lock system.",
                  timeAgo: "4:00 PM",
                  onTap: () {
                    // navigate to alert details
                  },
                ),
                SizedBox(height: 12.h),
                AlertCard(
                  severity: AlertSeverity.info,
                  title: "System Scan Complete",
                  description:
                      "Routine diagnostic scan found no anomalies.",
                  timeAgo: "9:00 PM",
                  onTap: () {
                    // navigate to alert details
                  },
                ),
                SizedBox(height: 12.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
