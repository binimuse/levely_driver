// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

import '../../../../constant/constants.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';

class NavDrawer extends StatefulWidget {
  HomeController controller = Get.find<HomeController>();

  @override
  State<NavDrawer> createState() => _NavDrawerState();
}

class _NavDrawerState extends State<NavDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.white,
        child: Container(
          color: const Color(0xffF6FBFB),
          height: double.infinity,
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 3.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25.0,
                          backgroundColor: Colors.white,
                          child: ClipRRect(
                            child: Image.asset('assets/images/logo_green.png'),
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                        ),
                        Text(
                          "LIVELY",
                          style: TextStyle(
                            color: const Color(0xff129797),
                            fontWeight: FontWeight.w400,
                            fontSize: 15.sp,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 2.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 6.h,
              ),
              Padding(
                padding: EdgeInsets.only(top: 3.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(1.h),
                      child: Container(
                        // width: 80.w,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [themeColor, themeColorFaded],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.account_box,
                              size: 13.h,
                              color: Colors.white,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                widget.controller.getDriver.isNotEmpty
                                    ? Text(
                                        widget.controller.getDriver.single.name,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      )
                                    : Text(
                                        "Driver Name",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                                widget.controller.getDriver.isNotEmpty
                                    ? Text(
                                        widget.controller.getDriver.single.city,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      )
                                    : Text(
                                        "Driver Address",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.sp),
                                      ),
                              ],
                            ),
                            SizedBox(
                              width: 10.w,
                            )
                          ],
                        ),
                      ),
                    ),
                    buildRow(
                        textcolors: Colors.grey,
                        colors: themeColor,
                        context: context,
                        icon: Icons.history,
                        title: "History",
                        onTap: () {}),
                    buildRow(
                        textcolors: Colors.grey,
                        colors: themeColor,
                        context: context,
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => SettingsFourPage()));
                        }),
                    buildRow(
                        textcolors: Colors.grey,
                        colors: themeColor,
                        context: context,
                        icon: Icons.info,
                        title: "About",
                        onTap: () {}),
                    buildRow(
                        textcolors: Colors.grey,
                        colors: themeColor,
                        context: context,
                        icon: Icons.logout,
                        title: "Logout",
                        onTap: () {
                          Get.dialog(AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            title: const Text(
                              'Warning, Logging Out',
                              style: TextStyle(fontSize: 18, color: Colors.red),
                            ),
                            content: const Text(
                                'Are you sure you want to log out ?',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black)),
                            actions: [
                              cancelButton,
                              continueButton,
                            ],
                          ));
                        }),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildRow({
    required BuildContext context,
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required Color colors,
    required Color textcolors,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(
            vertical: 1.h,
            horizontal: 6.w,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: colors,
                    size: 8.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    title,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: textcolors,
                        fontWeight: FontWeight.w500,
                        fontSize: 13.sp),
                  ),
                  const Spacer(),
                ],
              ),
              Divider()
            ],
          ),
        ),
      ),
    );
  }

  Widget cancelButton = TextButton(
      onPressed: () {
        // Navigator.pop();
        Get.back();
      },
      child: const Text('No', style: TextStyle(color: SOFT_BLUE)));

  Widget continueButton = TextButton(
      onPressed: () async {
        final prefs = await SharedPreferences.getInstance();

        final acc = await prefs.remove('access_token');
        final role = await prefs.remove('role');

        if (acc && role) {
          Get.offAllNamed(Routes.SIGN_IN);
        }
        // Navigator.pop(context);
      },
      child: const Text('Yes', style: TextStyle(color: SOFT_BLUE)));
}
