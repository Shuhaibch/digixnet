import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CCardWidget extends StatelessWidget {
  const CCardWidget({
    super.key,
    this.child,
    this.outterPadding,
    this.borderColor = CColors.borderPrimaryColor,
    this.backgroundColor = CColors.whiteColor,
    this.padding,
    this.margin,
    required this.elevation,
  });
  final double elevation;
  final Widget? child;
  final Color borderColor, backgroundColor;
  final EdgeInsetsGeometry? padding, margin, outterPadding;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: outterPadding!,
      child: Card(
        margin: margin,
        color: backgroundColor,
        elevation: elevation,
        shadowColor: borderColor,
        child: Padding(
          padding: padding!,
          child: child,
        ),
      ),
    );
  }
}
