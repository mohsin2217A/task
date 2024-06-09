import 'package:flutter/material.dart';

var view = WidgetsBinding.instance.platformDispatcher.views.single;

Size size = view.physicalSize / view.devicePixelRatio;

const num width = 375;
const num height = 812;
const num statusBar = 44;

class AppSizer {
  static get height {
    var window = MediaQueryData.fromView(
        WidgetsBinding.instance.platformDispatcher.views.single);
    num statusBar = window.viewPadding.top;
    num bottomBar = window.viewPadding.bottom;
    num screenHeight = size.height - statusBar - bottomBar;
    return screenHeight;
  }

  static get width {
    return size.width;
  }

  static double getRadius(double px) {
    return px;
  }

  static double getHorizontalSize(double px) {
    return ((px * width) / width);
  }

  ///This method is used to set padding/margin (for the top and bottom side) & height of the screen or widget according to the Viewport height.
  static double getVerticalSize(double px) {
    return ((px * height) / (height - statusBar));
  }

  ///This method is used to set smallest px in image height and width
  static double getSize(double px) {
    var height = getVerticalSize(px);
    var width = getHorizontalSize(px);
    if (height < width) {
      return height.toInt().toDouble();
    } else {
      return width.toInt().toDouble();
    }
  }

  ///This method is used to set text font size according to Viewport
  static double getFontSize(double px) {
    return getSize(px);
    //return 0;
  }

  ///This method is used to set padding responsively
  static EdgeInsetsGeometry getPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to set margin responsively
  static EdgeInsetsGeometry getMargin({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    return getMarginOrPadding(
      all: all,
      left: left,
      top: top,
      right: right,
      bottom: bottom,
    );
  }

  ///This method is used to get padding or margin responsively
  static EdgeInsetsGeometry getMarginOrPadding({
    double? all,
    double? left,
    double? top,
    double? right,
    double? bottom,
  }) {
    if (all != null) {
      left = all;
      top = all;
      right = all;
      bottom = all;
    }
    return EdgeInsets.only(
      left: getHorizontalSize(
        left ?? 0,
      ),
      top: getVerticalSize(
        top ?? 0,
      ),
      right: getHorizontalSize(
        right ?? 0,
      ),
      bottom: getVerticalSize(
        bottom ?? 0,
      ),
    );
  }
}
