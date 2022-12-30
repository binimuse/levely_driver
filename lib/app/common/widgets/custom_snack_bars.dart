// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lively_driver/app/config/theme/app_assets.dart';

import 'package:lottie/lottie.dart';

import '../../config/theme/custom_sizes.dart';

class ShowCommonSnackBar {
  ///SUCCESS SNACK BAR
  static void successSnackBar(String title, String message) {
    Get.snackbar(
      '',
      '',
      icon: SizedBox(
        width: CustomSizes.icon_size_10,
        height: CustomSizes.icon_size_10,
        child: Center(
          child: Lottie.asset(AppAssets.successLottie, fit: BoxFit.cover),
        ),
      ),
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
      ),
      duration: const Duration(
        seconds: 5,
      ),
      messageText: Text(
        message,
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
      ),
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 6,
          spreadRadius: 2,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
      borderColor: Colors.green.withOpacity(0.5),
      borderWidth: 2,
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      borderRadius: 6.0,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_12,
        vertical: CustomSizes.mp_v_2,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      backgroundColor: Colors.white,
      forwardAnimationCurve: Curves.easeInBack,
    );
  }

  ///WARNING SNACK BAR
  static void warningSnackBar(String title, String message) {
    Get.snackbar(
      '',
      '',
      icon: SizedBox(
        width: CustomSizes.icon_size_10,
        height: CustomSizes.icon_size_10,
        child: Center(
          child: Lottie.asset(AppAssets.warningFaceLottie, fit: BoxFit.cover),
        ),
      ),
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: Colors.yellow,
              fontWeight: FontWeight.bold,
            ),
      ),
      duration: const Duration(
        seconds: 5,
      ),
      messageText: Text(
        message,
        style: Theme.of(Get.context!).textTheme.bodySmall?.copyWith(
              color: Colors.grey,
            ),
      ),
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 6,
          spreadRadius: 2,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
      borderColor: Colors.yellow.withOpacity(0.5),
      borderWidth: 2,
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      borderRadius: 6.0,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_12,
        vertical: CustomSizes.mp_v_2,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      backgroundColor: Colors.white,
      forwardAnimationCurve: Curves.easeInBack,
    );
  }

  ///ERROR SNACK BAR
  static void errorSnackBar(String title, String message) {
    Get.snackbar(
      '',
      '',
      icon: SizedBox(
        width: CustomSizes.icon_size_10,
        height: CustomSizes.icon_size_10,
        child: Center(
          child: Lottie.asset(AppAssets.errorCancelLottie, fit: BoxFit.cover),
        ),
      ),
      titleText: Text(
        title,
        style: Theme.of(Get.context!).textTheme.bodyMedium?.copyWith(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
      ),
      duration: const Duration(
        seconds: 5,
      ),
      messageText: Text(
        message,
        style: Theme.of(Get.context!)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.grey),
      ),
      boxShadows: [
        BoxShadow(
          offset: const Offset(0, 3),
          blurRadius: 6,
          spreadRadius: 2,
          color: Colors.black.withOpacity(0.2),
        ),
      ],
      borderColor: Colors.red.withOpacity(0.5),
      borderWidth: 2,
      snackPosition: SnackPosition.TOP,
      isDismissible: true,
      borderRadius: 6.0,
      padding: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_12,
        vertical: CustomSizes.mp_v_2,
      ),
      margin: EdgeInsets.symmetric(
        horizontal: CustomSizes.mp_w_4,
        vertical: CustomSizes.mp_v_2,
      ),
      backgroundColor: Colors.white,
      forwardAnimationCurve: Curves.easeInBack,
    );
  }
}
