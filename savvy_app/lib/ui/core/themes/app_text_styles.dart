import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle onboardingTitle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w700,
    height: 39 / 32, // line-height / font-size
    color: AppColors.noirSavvy,
    fontStyle: FontStyle.normal,
  );

  static const TextStyle onboardingDescription = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 22 / 16, // line-height / font-size
    color: AppColors.noirSavvy,
    fontStyle: FontStyle.normal,
  );
}
