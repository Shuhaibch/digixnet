import 'package:cached_network_image/cached_network_image.dart';
import 'package:digixnet/core/commen/widgets/shimmer/shimmer_effect.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

import '../../../utils/color/colors.dart';

class CCustomRoundedImage extends StatelessWidget {
  const CCustomRoundedImage({
    this.borderRadius = BorderRadius.zero,
    super.key,
    this.width,
    this.height,
    required this.imageUrl,
    this.applyImageRadius = true,
    this.backgroundColor = CColors.lightColor,
    this.fit = BoxFit.contain,
    this.padding,
    this.isNetworkImage = false,
    this.onPressed,
    this.border,
    this.borderRadiusDouble = CSizes.md,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final Color? backgroundColor;
  final BoxBorder? border;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final double borderRadiusDouble;
  final VoidCallback? onPressed;
  final BorderRadiusGeometry borderRadius;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,
        decoration: BoxDecoration(
            border: border,
            borderRadius: BorderRadius.circular(borderRadiusDouble)),
        child: ClipRRect(
          borderRadius: applyImageRadius
              ? borderRadius
              : BorderRadius.zero,
          child: isNetworkImage
              ? CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: fit,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CShimmerEffect(
                          width: width ?? double.infinity,
                          height: height ?? 158),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                )
              : Image(
                  image: AssetImage(imageUrl),
                  fit: fit,
                ),
        ),
      ),
    );
  }
}
