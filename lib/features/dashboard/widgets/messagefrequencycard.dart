import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gp/core/theme/app_colors.dart';

class MessageFrequencyCard extends StatefulWidget {
  const MessageFrequencyCard({super.key});

  static const List<FlSpot> _dataPoints = [
    FlSpot(0, 1200),
    FlSpot(5, 1400),
    FlSpot(10, 1800),
    FlSpot(15, 2200),
    FlSpot(20, 3000),
    FlSpot(25, 4500),
    FlSpot(30, 7000),
    FlSpot(35, 10000),
    FlSpot(40, 12405),
    FlSpot(45, 12000),
    FlSpot(50, 11200),
    FlSpot(55, 10800),
    FlSpot(60, 11000),
  ];

  static const List<String> _timeLabels = ["14:31:00", "14:31:30", "14:32:00"];

  @override
  State<MessageFrequencyCard> createState() => _MessageFrequencyCardState();
}

class _MessageFrequencyCardState extends State<MessageFrequencyCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.medDarkblueColor,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(color: AppColors.gradblue, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "MESSAGE FREQUENCY",
                    style: TextStyle(
                      color: AppColors.greyColor,
                      fontSize: 11.sp,
                      letterSpacing: 1.2,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    "12,405 Hz",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              // Spike badge
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
                decoration: BoxDecoration(
                  color: AppColors.primaryred.withValues(alpha: 0.2),
                  borderRadius: BorderRadius.circular(6.r),
                  border: Border.all(
                    color: AppColors.primaryred.withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  "+400% Spike",
                  style: TextStyle(
                    color: AppColors.primaryred,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 20.h),

          // Chart
          SizedBox(
            height: 160.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 4000,
                    getDrawingHorizontalLine: (_) => FlLine(
                      color: AppColors.gradblue.withValues(alpha: 0.8),
                      strokeWidth: 1,
                      dashArray: [4, 4],
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 30,
                        reservedSize: 28.h,
                        getTitlesWidget: (value, meta) {
                          int index = (value / 30).round();
                          if (index < 0 || index >= MessageFrequencyCard._timeLabels.length) {
                            return const SizedBox.shrink();
                          }
                          return Padding(
                            padding: EdgeInsets.only(top: 10.h),
                            child: Text(
                              MessageFrequencyCard._timeLabels[index],
                              style: TextStyle(
                                color: AppColors.greyColor,
                                fontSize: 10.sp,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: MessageFrequencyCard._dataPoints,
                      isCurved: true,
                      curveSmoothness: 0.4,
                      color: AppColors.secondaryblueColor,
                      barWidth: 2.5,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppColors.secondaryblueColor.withValues(
                              alpha: 0.35,
                            ),
                            AppColors.secondaryblueColor.withValues(alpha: 0.0),
                          ],
                        ),
                      ),
                    ),
                  ],
                  minX: 0,
                  maxX: 60,
                  minY: 0,
                  maxY: 14000,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
