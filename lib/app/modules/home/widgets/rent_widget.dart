import 'package:countup/countup.dart';
import 'package:eazio/app/components/resources/custom_text_widget.dart';
import 'package:eazio/app/components/resources/string_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/app_decorations.dart';
import '../../../components/resources/app_fonts.dart';

class RentWidget extends StatelessWidget {
  const RentWidget({
    super.key,
    required this.count,
    required this.fadeDuration,
    required this.scaleDuration,
  });

  final double count;
  final Duration fadeDuration;
  final Duration scaleDuration;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: AppDecorations.roundedDecoration(
          bgColor: AppColors.white,
          borderColor: AppColors.white,
          borderRadius: 20),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const CustomTextWidget(
              text: StringConstants.rent,
              color: AppColors.headingColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
            const SizedBox(
              height: 20,
            ),
            Countup(
              begin: 0,
              end: count,
              duration: const Duration(seconds: 2),
              separator: ',',
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: AppColors.headingColor,
                  fontFamily: AppFonts.interFont),
            ),
            const CustomTextWidget(
              text: StringConstants.rent,
              color: AppColors.headingColor,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ],
        ),
      ),
    ).animate().fade(duration: fadeDuration).scale(delay: scaleDuration);
  }
}
