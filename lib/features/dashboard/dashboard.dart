import 'package:flutter/material.dart';
import 'package:gp/core/theme/app_colors.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryblueColor,
      body: 
      Center(
        child: Text("dashboard" , style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
