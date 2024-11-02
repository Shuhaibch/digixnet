import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.width,
    this.borderWidth = 1,
    this.height,
    this.radius = CSizes.cardRadiusLg,
    this.child,
    this.showBorder = false,
    this.borderColor = CColors.borderPrimaryColor,
    this.backgroundColor = CColors.whiteColor,
    this.padding,
    this.margin, this.boxShadow,
  });
  final double? width, height;
  final double radius, borderWidth;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
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
        borderRadius: BorderRadius.circular(radius),
        boxShadow:boxShadow ,
        border: showBorder
            ? Border.all(color: borderColor, width: borderWidth)
            : null,
      ),
      child: child,
    );
  }
}
