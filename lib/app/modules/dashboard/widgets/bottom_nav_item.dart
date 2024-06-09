import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/resources/app_colors.dart';

// ignore: must_be_immutable
class BottomNavItem extends StatelessWidget {
  BottomNavItem(
      {super.key, required this.icon, required this.isSelected, this.onTap});

  final IconData icon;
  bool isSelected;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call();
      },
      child: isSelected
          ? Container(
              width: 47,
              height: 47,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.yellowColor),
              child: Icon(
                icon,
                size: 23,
                color: AppColors.white,
              ),
            )
          : Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.blackColor),
              child: Icon(
                icon,
                size: 23,
                color: AppColors.white,
              ),
            ),
    );
  }
}
