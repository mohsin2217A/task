import 'package:countup/countup.dart';
import 'package:eazio/app/components/resources/custom_text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_decorations.dart';
import '../../../components/resources/app_fonts.dart';
import '../../../components/widgets/common_image_view.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({
    super.key,
    required this.fadeDuration,
    required this.scaleDuration,
  });

  final Duration fadeDuration;
  final Duration scaleDuration;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: AppDecorations.getRoundedShadowBox(
              bgColor: AppColors.white,
              borderColor: AppColors.white,
              borderRadius: 10),
          child: const Row(
            children: [
              Icon(
                CupertinoIcons.location_solid,
                color: AppColors.headingColor,
                size: 17,
              ),
              SizedBox(
                width: 5,
              ),
              CustomTextWidget(
                text: 'Saint Petersburg',
                color: AppColors.headingColor,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ).animate().fade(duration: fadeDuration).scale(delay: scaleDuration),
        const CommonImageView(
          width: 40,
          height: 40,
          radius: BorderRadius.all(Radius.circular(100)),
          url: 'https://www.w3schools.com/w3images/avatar6.png',
        ).animate().fade(duration: fadeDuration).scale(delay: scaleDuration)
      ],
    );
  }
}
