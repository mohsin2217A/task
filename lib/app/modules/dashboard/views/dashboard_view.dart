import 'package:eazio/app/components/resources/app_decorations.dart';
import 'package:eazio/app/modules/dashboard/widgets/bottom_nav_item.dart';
import 'package:eazio/app/modules/home/views/home_view.dart';
import 'package:eazio/app/modules/searching/views/searching_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../components/resources/app_colors.dart';
import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Obx(() {
            return controller.searchSelection.value
                ? SearchingView()
                : HomeView();
          }),
          Positioned(
            bottom: 1,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: AppDecorations.roundedDecoration(
                    borderColor: AppColors.darkBlackColor,
                    bgColor: AppColors.darkBlackColor,
                    borderRadius: 50),
                height: 60,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BottomNavItem(
                        icon: CupertinoIcons.search,
                        isSelected: controller.searchSelection.value,
                        onTap: () {
                          controller.onSearchClick();
                        },
                      ),
                      BottomNavItem(
                        icon: Icons.chat,
                        isSelected: controller.chatSelection.value,
                        onTap: () {
                          controller.onChatClick();
                        },
                      ),
                      BottomNavItem(
                        icon: Icons.home,
                        isSelected: controller.homeSelection.value,
                        onTap: () {
                          controller.onHomeClick();
                        },
                      ),
                      BottomNavItem(
                        icon: CupertinoIcons.heart_fill,
                        isSelected: controller.likesSelection.value,
                        onTap: () {
                          controller.onLikesClick();
                        },
                      ),
                      BottomNavItem(
                        icon: Icons.account_circle_rounded,
                        isSelected: controller.profileSelection.value,
                        onTap: () {
                          controller.onProfileClick();
                        },
                      ),
                    ],
                  );
                }),
              ),
            ),
          )
        ],
      ),
    );
  }
}
