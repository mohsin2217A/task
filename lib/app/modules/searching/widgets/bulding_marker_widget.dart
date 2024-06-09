import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_images.dart';
import '../../../components/widgets/common_image_view.dart';

class BuildingMarkerWidget extends StatelessWidget {
  const BuildingMarkerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
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
      child: const Center(
        child: CommonImageView(
          svgPath: AppImages.buildingImg,
          color: AppColors.white,
          width: 23,
          height: 23,
        ),
      ),
    );
  }
}
