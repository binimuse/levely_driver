import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/constants.dart';
import '../../network/controllers/network_controller.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

final NetworkController networkManager = Get.put(NetworkController());

class _SplashViewState extends State<SplashView> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  SplashController splashController = Get.find<SplashController>();

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1000,
      ),
    );

    _animation1 = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller1);

    _animation2 = Tween<double>(
      begin: 0.0,
      end: 100.0,
    ).animate(_controller2);

    _controller1.addListener(() {
      setState(() {});
    });

    _controller2.addListener(() {
      setState(() {});
    });

    _controller1.forward();

    _controller2.forward().whenCompleteOrCancel(() {
      Future.delayed(const Duration(milliseconds: 1500), () {
        splashController.checkIfLogin();
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller2.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => networkManager.connectionStatus.value != 0
        ? Scaffold(
            body: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [themeColor, themeColorFaded],
                    begin: FractionalOffset(0.0, 0.0),
                    end: FractionalOffset(1.0, 0.0),
                    stops: [0.0, 1.0],
                    tileMode: TileMode.decal),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 220,
                      width: 220,
                    ),
                    //  Image.asset("assets/images/name.gif")
                    Text(
                      "LIVELY",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.sp,
                        letterSpacing: 2.5,
                        height: 0.18.h,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        : noConn());
  }

  noConn() {
    final NetworkController networkManager = Get.find<NetworkController>();

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          "assets/images/no.png",
          height: 50,
          width: 40,
        ),
        Positioned(
          bottom: Get.height * 0.15,
          left: Get.width * 0.3,
          right: Get.width * 0.3,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  offset: const Offset(0, 13),
                  blurRadius: 25,
                  color: const Color(0xFF5666C2).withOpacity(0.17),
                ),
              ],
            ),
            // ignore: deprecated_member_use
            child: MaterialButton(
              color: SOFT_BLUE,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              onPressed: () {
                networkManager.restart();
                //  controller.update();
              },
              child: Text(
                "retry".toUpperCase(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        )
      ],
    ));
  }
}
