import 'dart:math';

import 'package:eazio/app/components/resources/custom_text_widget.dart';
import 'package:eazio/app/modules/searching/widgets/window_items_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_decorations.dart';
import '../controllers/searching_controller.dart';

class SearchingView extends StatelessWidget {
  SearchingView({super.key});

  final SearchingController controller = Get.put(SearchingController());

  @override
  Widget build(BuildContext context) {
    final Duration fadeDuration = 800.ms;
    final Duration scaleDuration = 300.ms;

    return Scaffold(
      body: Obx(() {
        return Stack(
          children: [
            GoogleMap(
              onMapCreated: controller.onMapCreated,
              markers: controller.markersList.toSet(),
              rotateGesturesEnabled: true,
              zoomGesturesEnabled: true,
              scrollGesturesEnabled: true,
              zoomControlsEnabled: false,
              compassEnabled: false,
              myLocationEnabled: false,
              myLocationButtonEnabled: false,
              mapToolbarEnabled: false,
              mapType: MapType.normal,
              initialCameraPosition: CameraPosition(
                target: controller.latLng!.value,
                zoom: 14.0,
              ),
            ),
            Positioned(
              bottom: 100,
              left: 20,
              child: SafeArea(
                child: Obx(() {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      !controller.showWindow.value
                          ? GestureDetector(
                              onTap: () {
                                controller.showWindow.value = true;
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: AppDecorations.roundedDecoration(
                                    bgColor: AppColors.darkGreyColor
                                        .withOpacity(0.7),
                                    borderColor: AppColors.darkGreyColor
                                        .withOpacity(0.7),
                                    borderRadius: 200),
                                child: Transform.rotate(
                                  angle: 60 * pi / 180,
                                  child: const Icon(
                                    Icons.ac_unit,
                                    color: AppColors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            )
                          : const SizedBox(),
                      controller.showWindow.value
                          ? windowWidget()
                          : const SizedBox(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: AppDecorations.roundedDecoration(
                            bgColor: AppColors.darkGreyColor.withOpacity(0.7),
                            borderColor:
                                AppColors.darkGreyColor.withOpacity(0.7),
                            borderRadius: 200),
                        child: Transform.rotate(
                          angle: 60 * pi / 180,
                          child: const Icon(
                            Icons.navigation_outlined,
                            color: AppColors.white,
                            size: 18,
                          ),
                        ),
                      )
                    ],
                  );
                }),
              ),
            )
                .animate()
                .fade(duration: fadeDuration)
                .scale(delay: scaleDuration),
            Positioned(
              bottom: 120,
              right: 20,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: AppDecorations.roundedDecoration(
                    bgColor: AppColors.darkGreyColor.withOpacity(0.7),
                    borderColor: AppColors.darkGreyColor.withOpacity(0.7),
                    borderRadius: 30),
                child: const Row(
                  children: [
                    Icon(
                      Icons.filter_list_sharp,
                      color: AppColors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                      text: 'List of variants',
                      color: AppColors.white,
                      fontSize: 12,
                    )
                  ],
                ),
              ),
            ) .animate()
                .fade(duration: fadeDuration)
                .scale(delay: scaleDuration),
            SafeArea(
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        decoration: AppDecorations.getRoundedShadowBox(
                            bgColor: AppColors.white,
                            borderColor: AppColors.white,
                            borderRadius: 30),
                        child: const Row(
                          children: [
                            Icon(
                              CupertinoIcons.search,
                              color: AppColors.blackColor,
                              size: 17,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            CustomTextWidget(
                              text: 'Saint Petersburg',
                              color: AppColors.blackColor,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ],
                        ),
                      ),
                    ) .animate()
                        .fade(duration: fadeDuration)
                        .scale(delay: scaleDuration),
                    const SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: AppDecorations.roundedDecoration(
                          bgColor: AppColors.white,
                          borderColor: AppColors.darkGreyColor.withOpacity(0.7),
                          borderRadius: 200),
                      child: const Icon(
                        Icons.filter_list_sharp,
                        color: AppColors.blackColor,
                        size: 20,
                      ),
                    )
                        .animate()
                        .fade(duration: fadeDuration)
                        .scale(delay: scaleDuration)
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget windowWidget() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 14),
      decoration: AppDecorations.roundedDecoration(
          bgColor: AppColors.lightGoldColor,
          borderColor: AppColors.lightGoldColor,
          borderRadius: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Obx(() {
            return WindowItemsWidget(
              text: 'Cosy Areas',
              selectedOption: controller.selectedOption.value,
              onTap: (text) {
                controller.selectedOption.value = text;
                controller.showWindow.value = false;
              },
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return WindowItemsWidget(
              text: 'Price',
              selectedOption: controller.selectedOption.value,
              onTap: (text) {
                controller.selectedOption.value = text;
                controller.showWindow.value = false;
                controller.createPriceMarkers();
              },
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return WindowItemsWidget(
              text: 'Infrastructure',
              selectedOption: controller.selectedOption.value,
              onTap: (text) {
                controller.selectedOption.value = text;
                controller.showWindow.value = false;
                controller.createBuildingMarkers();
              },
            );
          }),
          const SizedBox(
            height: 20,
          ),
          Obx(() {
            return WindowItemsWidget(
              text: 'Without any layer  ',
              selectedOption: controller.selectedOption.value,
              onTap: (text) {
                controller.selectedOption.value = text;
                controller.showWindow.value = false;
              },
            );
          }),
        ],
      ),
    );
  }
}
