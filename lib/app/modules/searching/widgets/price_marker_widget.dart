import 'package:eazio/app/components/resources/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/resources/app_colors.dart';

class PriceMarkerWidget extends StatelessWidget {
  const PriceMarkerWidget({super.key, this.price});

  final String? price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 40,
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.yellowColor,
        ),
        color: AppColors.yellowColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomRight: Radius.circular(10.0),
        ),
      ),
      child: Center(
        child: CustomTextWidget(
          text: price ?? "",
          color: AppColors.white,
          fontWeight: FontWeight.w500,
          fontSize: 12,
        ),
      ),
    );
  }
}
