import 'package:eazio/app/components/resources/app_decorations.dart';
import 'package:eazio/app/components/resources/custom_text_widget.dart';
import 'package:eazio/app/util/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../util/sizer.dart';
import '../resources/app_colors.dart';
import '../resources/app_images.dart';
import 'common_image_view.dart';

class CustomSwitchButton extends StatefulWidget {
  final double height;
  final double radius;
  final double padding;
  final String? swipeText;
  final Future<bool> Function()? onTrigger;
  final bool vibrate;
  final String? name;

  const CustomSwitchButton({
    super.key,
    this.height = 30,
    this.radius = 100,
    this.padding = 2,
    this.onTrigger,
    this.swipeText,
    this.name,
    this.vibrate = false,
  });

  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton>
    with TickerProviderStateMixin {
  double position = 0;

  late Size size;

  late double width;

  late AnimationController animationController;

  bool triggered = false;

  @override
  void initState() {
    width = widget.height * 2.3;
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: AppConstants.switchDurationMilli),
      reverseDuration:
          const Duration(milliseconds: AppConstants.switchDurationMilli),
    );
    animationController.addListener(() {
      setState(() {
        position = getFullWidth() * animationController.value;
      });
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.dismissed) {
        triggered = false;
      } else if (status == AnimationStatus.completed) {
        triggerFunction();
      }
    });
    super.initState();
  }

  void triggerFunction() async {
    if (!triggered) {
      bool? val = await widget.onTrigger?.call();
      triggered = true;
      if (val == false) {
        animationController.reverse(
          from: position / getFullWidth(),
        );
      }
    }
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (con, cons) {
      size = cons.biggest;
      return Container(
        height: widget.height,
        width: size.width,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.radius),
          border: Border.all(width: 1, color: Colors.transparent),
          color: Colors.transparent,
        ),
        child: Stack(
          children: [
            buildDecoration(),
            Visibility(
              visible: position > 0,
              child: Container(
                height: widget.height,
                width: position + width - widget.padding,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.radius),
                    gradient: const LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [
                          AppColors.swipeBgColor,
                          AppColors.swipeBgColor,
                        ])),
                child: Center(
                  child: CustomTextWidget(
                    text: widget.name ?? "",
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              left: position > 0 ? position + 50 : position,
              child: GestureDetector(
                  onHorizontalDragUpdate: (drag) {
                    setPositon(drag.delta.dx);
                  },
                  onHorizontalDragEnd: (drag) {
                    checkPosition();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: buildTrigger()),
            ),
          ],
        ),
      );
    });
  }

  Widget buildDecoration() {
    final double fontsize = AppSizer.getFontSize(12);
    return Stack(
      children: [
        Align(
            alignment: const FractionalOffset(0.95, 0.5),
            child: CustomTextWidget(
              text: widget.swipeText ?? "",
              color: AppColors.white,
              fontSize: fontsize,
            ))
      ],
    );
  }

  Widget buildTrigger() {
    //width = AppSizer.getHorizontalSize(100);
    return Container(
      width: 40,
      height: widget.height,
      child: Padding(
        padding: EdgeInsets.all(widget.padding),
        child: Container(
          height: widget.height,
          padding:
              EdgeInsets.symmetric(horizontal: AppSizer.getHorizontalSize(11)),
          decoration: AppDecorations.getRoundedShadowBox2(
              borderColor: AppColors.white,
              bgColor: AppColors.white,
              borderRadius: 100),
          child: const CommonImageView(
            svgPath: AppImages.nextIcon,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  void checkPosition() {
    //double div = (size.width / 2)-(width/2);
    double div = (size.width - width) / 2;
    if (position >= div) {
      animationController.forward(
        from: position / getFullWidth(),
      );
    } else if (position < div) {
      animationController.reverse(
        from: position / getFullWidth(),
      );
    }
  }

  void setPositon(double val) {
    double pos = position + val;
    if (pos >= 0 && pos <= getFullWidth()) {
      setState(() {
        position = pos;
      });
      if (widget.vibrate) {
        // CommonMethods.vibrate();
      }
    }
  }

  double getFullWidth() {
    return size.width - width;
  }
}
