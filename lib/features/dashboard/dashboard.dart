import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/core/helper/images.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/core/theme/styles.dart';
import 'package:gp/features/dashboard/widgets/lastsalretcard.dart';
import 'package:gp/features/dashboard/widgets/messagefrequencycard.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryblueColor,
      appBar: AppBar(
        toolbarHeight: 90.h,
        centerTitle: true,
        backgroundColor: AppColors.primaryblueColor,
        title: Text(
          "Vehicle Sentinel",
          style: Styles.inter18bold.copyWith(color: Colors.white),
        ),
        leading: Icon(Icons.menu_rounded, color: Colors.white),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: Icon(Icons.notifications_none_rounded, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 20.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        Container(
                          height: 45.h,
                          width: 200.w,
                          decoration: BoxDecoration(
                            color: AppColors.primarygreen.withValues(
                              alpha: 0.1,
                            ),
                            borderRadius: BorderRadius.circular(9999.r),
                            border: BoxBorder.all(
                              color: AppColors.primarygreen.withValues(
                                alpha: 0.4,
                              ),
                              width: 0.9.w,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.primarygreen.withValues(
                                  alpha: 0.2,
                                ),
                                spreadRadius: 4,
                                blurRadius: 8,
                                offset: Offset(
                                  0,
                                  0,
                                ), // changes position of shadow
                              ),
                            ],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                Images.sysSecure,
                                width: 14.w,
                                height: 17.h,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                "SYSTEM SECURE",
                                style: Styles.inter14medium.copyWith(
                                  color: AppColors.primarygreen,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ), //system inication
                        SizedBox(height: 28.h),
                        Text(
                          "Safe",
                          style: Styles.inter32bold.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "Last scan: 2 mins ago",
                          style: Styles.inter14medium.copyWith(
                            color: AppColors.greyColor,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 24.h),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.secondaryblueColor,
                              foregroundColor: Colors.white,
                              maximumSize: Size(167.w, 46.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(9999.r),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  Images.scan,
                                  width: 17.w,
                                  height: 17.h,
                                ),
                                SizedBox(width: 8.w),
                                Text(
                                  "Scan Now",
                                  style: Styles.inter16semi.copyWith(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ), //scan buuton
                        SizedBox(height: 50.h),
                        MessageFrequencyCard(),
                        SizedBox(height: 20.h),
                        LastAlertCard(
                          time: "10:42 AM",
                          alertTitle: "Port Scan Detected",
                          onDetailsTap: () {
                            // navigate to alert details
                          },
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
