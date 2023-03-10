import 'dart:async';

import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lively_driver/app/modules/home/views/widgets/nav_drawer.dart';
import 'package:sizer/sizer.dart';

import '../../../constant/constants.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  static final CameraPosition initialposition = CameraPosition(
      target: LatLng(9.014302408008586, 38.757550910492846), zoom: 18);
  late GoogleMapController googleMapController;
  late final Completer<GoogleMapController> _controllerGoogleMap = Completer();
  late Position currentposition;
  var geolocator = Geolocator();
  LatLng curLocation = const LatLng(23.0525, 72.5667);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.keyforall,
      drawer: NavDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() => controller.isLoading.value == true
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.height,
                    child: GoogleMap(
                      mapType: MapType.terrain,
                      zoomGesturesEnabled: true,
                      zoomControlsEnabled: false,
                      myLocationEnabled: true,
                      initialCameraPosition: CameraPosition(
                          //innital position in map
                          target: controller.currentPosition,
                          zoom: 11 //initial position
                          ),
                      circles: {
                        Circle(
                          onTap: () {},
                          circleId: const CircleId('currentCircle'),
                          center: curLocation,
                          radius: 80,
                          fillColor: themeColor.withOpacity(0.5),
                          strokeColor: themeColor.withOpacity(0.2),
                        ),
                      },
                      myLocationButtonEnabled: true,
                      compassEnabled: true,
                      onMapCreated: (GoogleMapController controller) {
                        _controllerGoogleMap.complete(controller);
                      },
                    ))
                : Center(
                    child: Text(
                      "Turn On To Get Started",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w600, fontSize: 12),
                    ),
                  )),
            customappbar(context),
            popupdialogue(context),
            Positioned(
              bottom: 10.h,
              right: 5.w,
              child: Obx(() {
                return FlutterSwitch(
                  activeColor: Colors.green,
                  inactiveColor: Colors.red,
                  width: 30.w,
                  height: 6.h,
                  valueFontSize: 25.0,
                  toggleSize: 10.w,
                  value: controller.status.value,
                  borderRadius: 15.0,
                  padding: 8.0,
                  showOnOff: true,
                  onToggle: (val) async {
                    controller.getLocation();
                    controller.status.value = val;
                    // controller.sendStatus();

                    // if (val == true) {
                    //   controller.isStatusOn(true);
                    //   controller.getUserId();
                    // } else {
                    //   controller.isStatusOn(false);
                    // }
                  },
                );
              }),
            ),
            // Positioned(
            //   bottom: 2.h,
            //   left: 6.w,
            //   right: 6.w,
            //   child: finishandstartbutton("Start Delivery", context),
            // ),
          ],
        ),
      ),
    );
  }

  Container customappbar(BuildContext context) {
    return Container(
      height: 8.h,
      width: Get.width,
      color: Colors.white.withOpacity(0.6),
      padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            color: Colors.white,
            child: IconButton(
                onPressed: () {
                  controller.keyforall.currentState!.openDrawer();

                  //  Get.toNamed(Routes.MY_PROFILE);
                },
                icon: Icon(
                  Icons.menu,
                  color: Colors.greenAccent,
                  size: 9.w,
                )),
          ),
          SizedBox(
            width: 2.w,
          ),
          // Container(
          //   color: Colors.white,
          //   child: IconButton(
          //       onPressed: () {
          //         // Get.to(ListOfDeleivery());

          //       },
          //       icon: Icon(
          //         Icons.menu,
          //         color: Colors.greenAccent,
          //         size: 9.w,
          //       )),
          // ),
        ],
      ),
    );
  }

  Widget popupdialogue(BuildContext context) {
    return Obx(() {
      if (controller.isDriverRequestActiveForDropOff.value &&
          controller.isStatusOn.value) {
        return Container(
          width: Get.width,
          height: 28.h,
          margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(6)),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, top: 20),
                    width: 25.w,
                    height: 15.h,
                    decoration: BoxDecoration(
                        color:
                            Color.fromARGB(255, 68, 171, 255).withOpacity(0.1),
                        borderRadius: BorderRadius.all(
                          Radius.circular(6),
                        )),
                    child: Icon(
                      Icons.local_shipping_rounded,
                      size: 15.w,
                      color: Color.fromARGB(255, 68, 171, 255),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.my_location,
                                size: 5.w,
                                color: Color.fromARGB(255, 68, 171, 255),
                              ),
                              Expanded(
                                child: RichText(
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  text: TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'From :',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey)),
                                      TextSpan(
                                        text: ' ${controller.fromName.value}',
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 2.4.w),
                            child: SizedBox(
                              height: 4.h,
                              child: DottedLine(
                                dashLength: 10,
                                direction: Axis.vertical,
                                dashColor: Color.fromARGB(255, 68, 171, 255),
                                dashGapLength: 1.5,
                                lineThickness: 1,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                size: 5.5.w,
                                color: Color.fromARGB(255, 68, 171, 255),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: 'To :',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey)),
                                    TextSpan(
                                        text: '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black))
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 17.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 20.w,
                          height: 6.h,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 68, 171, 255),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(6),
                                  bottomRight: Radius.circular(6))),
                          child: Center(
                              child: Text(
                            "${controller.cost.value} ETB",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          )),
                        ),
                        Text(
                          "Details",
                          style: TextStyle(
                              color: Color.fromARGB(255, 68, 171, 255),
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(width: 2.w,)
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 2.w,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        height: 6.h,
                        width: 42.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.rejectDropoffRequest();
                              FlutterRingtonePlayer.stop();
                              FlutterRingtonePlayer.stop();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                            ),
                            child: Text('Decline',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                          ),
                        )),
                    SizedBox(
                        height: 6.h,
                        width: 42.w,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.acceptDropoffRequest();
                              FlutterRingtonePlayer.stop();
                              FlutterRingtonePlayer.stop();
                              //S controller.updateDropoff();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                            ),
                            child: Text('Accept',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600)),
                          ),
                        )),
                  ],
                ),
              ),
            ],
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }

  Container finishandstartbutton(String title, BuildContext context) {
    return Container(
      width: 80.w,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 62, 164, 247),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ElevatedButton(
        onPressed: () {
          //    Get.toNamed(Routes.MAIN_SCREEN_DISTRIBUTER);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromARGB(255, 62, 164, 247),
          shadowColor: Colors.grey,
          elevation: 15,
          padding: EdgeInsets.symmetric(vertical: 2.3.h),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
