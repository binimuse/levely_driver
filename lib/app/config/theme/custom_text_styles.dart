// ignore_for_file: depend_on_referenced_packages


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_driver/app/config/theme/custom_colors.dart';

import 'custom_sizes.dart';

class CustomTextStyles {
  /*
  text color based on app current theme
  color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
  */

  static final bodySmall = TextStyle(
    fontSize: CustomSizes.font_10,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final bodyMedium = TextStyle(
    fontSize: CustomSizes.font_12,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final bodyLarge = TextStyle(
    fontSize: CustomSizes.font_14,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final headlineSmall = TextStyle(
    fontSize: CustomSizes.font_16,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final headlineMedium = TextStyle(
    fontSize: CustomSizes.font_22,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static final headlineLarge = TextStyle(
    fontSize: CustomSizes.font_28,
    color: Get.isDarkMode ? CustomColors.white : CustomColors.black,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );
}
