// ignore_for_file: invalid_use_of_protected_member, deprecated_member_use, library_prefixes

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../../config/theme/custom_colors.dart';
import '../../../../config/theme/custom_sizes.dart';
import '../../../../config/utils/pages_util.dart';
import '../../../../routes/app_pages.dart';
import '../../controllers/home_controller.dart';
import 'package:slider_button/slider_button.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import 'item_order2.dart';

class ListOfDeleivery extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: PagesUtil.getAppBarLightStyle(),
          toolbarHeight: 0.0,
        ),
        body: Obx(() => controller.getDropOffss.value == true
            ? RefreshIndicator(
                onRefresh: () async {},
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    FontAwesomeIcons.box,
                                    size: CustomSizes.icon_size_6,
                                    color: CustomColors.blue,
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        controller.dropOffOrder[0].fromname,
                                        style: TextStyle(
                                            color: Color(0xff4a4a4a),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ],
                              ),

                              ///Change All the color and size from here.
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: () {
                              UrlLauncher.launch(
                                  'tel:${controller.dropOffOrder[0].fromPhone.toString()}');
                            },
                            child: Container(
                              color: Colors.white,
                              child: Expanded(
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      FontAwesomeIcons.phone,
                                      size: CustomSizes.icon_size_6,
                                      color: CustomColors.blue,
                                    ),
                                    Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          controller.dropOffOrder[0].fromPhone,
                                          style: TextStyle(
                                              color: Color(0xff4a4a4a),
                                              fontWeight: FontWeight.w500,
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                ///Change All the color and size from here.
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(
                            horizontal: CustomSizes.mp_w_4),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: index == 0
                                ? EdgeInsets.only(top: CustomSizes.mp_v_2)
                                : EdgeInsets.zero,
                            child: ItemOrder2(
                              dropofforder: controller.dropOffOrder[index],
                              latlngs: controller.latlngs.value,
                              index: index,
                              onTap: () {},
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: CustomSizes.mp_w_2,
                          );
                        },
                        itemCount: controller.dropOffOrder.length,
                      ),
                    ),
                    controller.dropOffOrder.single.status != "STARTED"
                        ? Container(
                            color: Colors.green,
                            width: double.infinity,
                            child: SliderButton(
                              action: () {
                                // controller.startTrip();

                                // Get.toNamed(Routes.SCAN_QR_FOR_DRIVER,
                                //     arguments: {
                                //       "controller": controller,
                                //     });
                              },

                              ///Put label over here
                              label: Text(
                                "Slide to Start",
                                style: TextStyle(
                                    color: Color(0xff4a4a4a),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17),
                              ),
                              icon: Center(
                                  child: Icon(
                                Icons.trip_origin,
                                color: Colors.white,
                                size: 40.0,
                                semanticLabel:
                                    'Text to announce in accessibility modes',
                              )),

                              ///Change All the color and size from here.
                              width: 230,
                              radius: 10,
                              buttonColor: CustomColors.grey,
                              backgroundColor: CustomColors.blue,
                              highlightedColor: Colors.white,
                              baseColor: CustomColors.black,
                            ),
                          )
                        : SizedBox()
                  ],
                ),
              )
            : Center(child: CircularProgressIndicator())));
  }
}
