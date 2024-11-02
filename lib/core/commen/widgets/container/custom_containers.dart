import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class CCustomContainer extends StatelessWidget {
  const CCustomContainer({
    super.key,
    this.width,
    this.borderWidth = 1,
    this.height,
    this.radius = CSizes.cardRadiusLg,
    this.child,
    this.borderRadius,
    this.showBorder = false,
    this.borderColor = CColors.borderPrimaryColor,
    this.backgroundColor = CColors.whiteColor,
    this.padding,
    this.margin,
  });
  final double? width, height;
  final double radius, borderWidth;
  final Widget? child;
  final BorderRadiusGeometry? borderRadius;
  final bool showBorder;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: child,
    );
  }
}
