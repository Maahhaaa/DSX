import 'package:flutter/material.dart';
import 'package:gp/core/theme/app_colors.dart';
import 'package:gp/features/notification/notify_screen.dart';
import 'package:gp/features/onboarding/onboardingScreen.dart';
import 'package:gp/features/onboarding/widgets/onboard_app_bar.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class PageIndactor extends StatefulWidget {
  const PageIndactor({super.key});

  @override
  State<PageIndactor> createState() => _PageIndactorState();
}

class _PageIndactorState extends State<PageIndactor> {
  final PageController controller = PageController();
  final List<Widget> pages = [OnboardingScreen(), NotifyScreen()];
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(87),
        child: OnboardAppBar(),
      ),
      backgroundColor: AppColors.primaryblueColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(controller: controller, children: pages),
            ),
            SmoothPageIndicator(
              controller: controller,
              count: pages.length,
              effect: ExpandingDotsEffect(
                dotHeight: 8,
                dotWidth: 8,
                activeDotColor: AppColors.secondaryblueColor,
                dotColor: Color(0xff374151),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
