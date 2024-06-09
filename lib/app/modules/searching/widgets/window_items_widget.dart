import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../components/resources/app_colors.dart';
import '../../../components/resources/custom_text_widget.dart';

class WindowItemsWidget extends StatelessWidget {
  const WindowItemsWidget(
      {super.key, this.text, this.onTap, this.selectedOption});

  final String? text;
  final Function(String text)? onTap;
  final String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap?.call(text ?? "");
      },
      child: Row(
        children: [
          Icon(
            Icons.settings,
            size: 20,
            color: text == selectedOption
                ? AppColors.yellowColor
                : AppColors.darkGreyColor,
          ),
          const SizedBox(
            width: 5,
          ),
          CustomTextWidget(
            text: text ?? "",
            color: text == selectedOption
                ? AppColors.yellowColor
                : AppColors.darkGreyColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          )
        ],
      ),
    );
  }
}
