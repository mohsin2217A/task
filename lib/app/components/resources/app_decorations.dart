import 'package:eazio/app/components/resources/dimens.dart';
import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppDecorations {
  static BoxDecoration roundedDecoration(
      {Color borderColor = AppColors.greyColor,
      Color bgColor = AppColors.greyColor,
      double borderRadius = AppDimens.borderRadius}) {
    return BoxDecoration(
        border: Border.all(
          color: borderColor,
        ),
        color: bgColor,
        borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
  }

  static BoxDecoration getRoundedShadowBox({
    Color borderColor = AppColors.primaryColor,
    Color bgColor = AppColors.white,
    double width = 1,
    double borderRadius = AppDimens.borderRadius,
  }) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor,
        width: width,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.textFieldBorderColor.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0.2, 0.2),
        )
      ],
    );
  }

  static BoxDecoration getRoundedShadowBox2({
    Color borderColor = AppColors.primaryColor,
    Color bgColor = AppColors.white,
    double width = 1,
    double borderRadius = AppDimens.borderRadius,
  }) {
    return BoxDecoration(
      color: bgColor,
      borderRadius: BorderRadius.circular(borderRadius),
      border: Border.all(
        color: borderColor,
        width: width,
      ),
      boxShadow: [
        BoxShadow(
          color: AppColors.textFieldBorderColor.withOpacity(0.4),
          spreadRadius: 5,
          blurRadius: 10,
          offset: const Offset(0.2, 0.2),
        )
      ],
    );
  }

  static BoxDecoration gradientBox() {
    return const BoxDecoration(
      gradient: LinearGradient(
          colors: [
            AppColors.bgStartColor,
            AppColors.bgEndColor,
          ],
          begin: Alignment(-1.0, -1),
          end: Alignment(-1.0, 1),
          tileMode: TileMode.clamp),
    );
  }
}
