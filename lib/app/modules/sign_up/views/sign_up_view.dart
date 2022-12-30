import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../common/widgets/custom_normal_button.dart';
import '../../../config/theme/app_assets.dart';
import '../../../config/theme/custom_colors.dart';
import '../../../config/theme/custom_sizes.dart';
import '../../../config/utils/pages_util.dart';
import '../../../constant/constants.dart';
import '../../../helper/keyboard.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: controller.reusableWidget.bottomAppBar(),
      resizeToAvoidBottomInset: false,
      body: Container(
        color: const Color(0xffF6FBFB),
        height: double.infinity,
        child: Stack(
          children: [
            ///BOTTOM IMAGE AND GUEST BUTTON

            ///OTHER WIDGETS
            Padding(
              padding: EdgeInsets.all(1.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ///HEADER TEXT
                  ///
                  ///

                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: buildActHeader2(context),
                  ),
                  SizedBox(
                    height: 3.5.h,
                  ),

                  ///BUILD DECORATIVE IMAGE
                  buildImage(),
                  SizedBox(
                    height: 5.5.h,
                  ),

                  const Expanded(
                    child: SizedBox(),
                  ),
                  buildSignInButton(context),
                  SizedBox(
                    height: 1.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  buildHeader() {
    return Text(
      "Hello Again!\nWelcome\nBack",
      style: TextStyle(
        color: SOFT_BLUE,
        fontSize: 28.sp,
        letterSpacing: 1.5,
        height: 0.18.h,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Image buildImage() {
    return Image.asset(
      AppAssets.anniversary,
      width: double.infinity,
      height: 25.h,
      fit: BoxFit.contain,
    );
  }

  Text buildActHeader2(BuildContext context) {
    return Text(
      "LIVELY DRIVER",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: SOFT_BLUE,
        fontSize: 28.sp,
        letterSpacing: 1.5,
        height: 0.18.h,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  buildSignInButton(context) {
    return Column(
      children: [
        Text(
          'To signup you need to contact the administration',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.sp,
            letterSpacing: 1.5,
            height: 0.18.h,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 5.5.h,
        ),
        SizedBox(
          width: double.infinity,
          child: Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [themeColor, themeColorFaded],
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: ElevatedButton(
              onPressed: () {
                KeyboardUtil.hideKeyboard(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                padding: EdgeInsets.symmetric(vertical: 2.3.h),
              ),
              child: Text(
                'Contact The Admin',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
