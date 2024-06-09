import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../resources/app_images.dart';

class CommonImageView extends StatelessWidget {
  ///[url] is required parameter for fetching network image
  final String? url;

  ///[imagePath] is required parameter for showing png,jpg,etc image
  final String? imagePath;

  ///[svgPath] is required parameter for showing svg image
  final String? svgPath;

  ///[file] is required parameter for fetching image file
  final File? file;

  final double? height;
  final double? width;
  final Color? color;
  final BoxFit fit;
  final String placeHolder;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadiusGeometry radius;
  final BoxBorder? border;
  final bool matchTextDirection;

  ///a [CustomImageView] it can be used for showing any type of images
  /// it will shows the placeholder image if image is not found on network image
  const CommonImageView({
    super.key,
    this.url,
    this.imagePath,
    this.svgPath,
    this.file,
    this.height,
    this.width,
    this.color,
    this.fit = BoxFit.fill,
    this.alignment,
    this.onTap,
    this.radius = BorderRadius.zero,
    this.margin,
    this.border,
    this.placeHolder = AppImages.applicationLogo,
    this.matchTextDirection = false,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
      alignment: alignment!,
      child: _buildWidget(),
    )
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
      padding: margin ?? EdgeInsets.zero,
      child: GestureDetector(
        onTap: onTap,
        child: _buildCircleImage(),
      ),
    );
  }

  ///build the image with border radius
  _buildCircleImage() {
    return ClipRRect(
      borderRadius: radius,
      child: _buildImageWithBorder(),
    );
  }

  ///build the image with border and border radius style
  _buildImageWithBorder() {
    if (border != null) {
      return Container(
        decoration: BoxDecoration(
          border: border,
          borderRadius: radius,
        ),
        child: _buildImageView(),
      );
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (file != null && file!.path.isNotEmpty) {
      return Image.file(
        file!,
        height: height,
        width: width,
        fit: fit,
        color: color,
        errorBuilder: (context, _, e) => SvgPicture.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
          matchTextDirection: matchTextDirection,
        ),
      );
    } else if (url != null && url!.isNotEmpty) {
      return CachedNetworkImage(
        height: height,
        width: width,
        fit: fit,
        imageUrl: url!,
        color: color,
        placeholder: (context, url) => Container(),
        errorWidget: (context, url, error) => SvgPicture.asset(
          placeHolder,
          height: height,
          width: width,
          fit: fit,
        ),
      );
    } else if (svgPath != null && svgPath!.isNotEmpty) {
      return SizedBox(
        height: height,
        width: width,
        child: SvgPicture.asset(
          svgPath!,
          height: height,
          width: width,
          fit: fit,
          color: color,
          matchTextDirection: matchTextDirection,
        ),
      );
    } else if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.asset(
        imagePath!,
        height: height,
        width: width,
        fit: fit,
        color: color,
        matchTextDirection: matchTextDirection,
      );
    }
    return const SizedBox();
  }
}
