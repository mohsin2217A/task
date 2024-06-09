import 'package:flutter/material.dart';
import '../../util/sizer.dart';
import 'app_colors.dart';
import 'app_font_size.dart';
import 'app_fonts.dart';

class CustomTextWidget extends StatelessWidget {
  final String text;
  final String fontFamily;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  final TextOverflow? overflow;
  final bool? center;
  final bool? alignRight;
  final int? maxLines;
  final FontStyle? fontStyle;
  final double? height;
  final double? letterSpacing;
  final TextDecoration? textDecoration;
  final TextDirection? textDirection;

  const CustomTextWidget({
    super.key,
    required this.text,
    this.color = AppColors.black2,
    this.fontSize = AppFontSize.extraSmall,
    this.fontWeight = FontWeight.w400,
    this.overflow,
    this.center,
    this.alignRight,
    this.maxLines,
    this.fontStyle,
    this.height,
    this.letterSpacing,
    this.fontFamily = AppFonts.interFont,
    this.textDecoration,
    this.textDirection,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow ?? TextOverflow.visible,
      maxLines: maxLines,
      textDirection: textDirection,
      style: TextStyle(
        color: color,
        fontSize: AppSizer.getFontSize(fontSize),
        letterSpacing: letterSpacing,
        fontFamily: fontFamily,
        fontWeight: fontWeight,
        fontStyle: fontStyle ?? FontStyle.normal,
        decoration: textDecoration,
      ),
    );
  }
}
