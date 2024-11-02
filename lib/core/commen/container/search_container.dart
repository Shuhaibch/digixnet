import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CSearchContainer extends StatelessWidget {
  const CSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
    required this.controller,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding,
        child: Container(
            width: CDeviceUtils.getScreenWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: CSizes.md),
            decoration: BoxDecoration(
                color:
                    showBackground ? CColors.primaryColor : Colors.transparent,
                borderRadius: BorderRadius.circular(8),
                border: showBorder
                    ? Border.all(color: CColors.primaryColor, width: 1)
                    : null),
            child: TextFormField(
              autofocus: false,
              cursorColor: CColors.blackColor,
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.only(top: 15),
                  suffixIcon: Icon(icon, color: CColors.secondaryColor),
                  hintText: text,
                  hintStyle: Theme.of(context).textTheme.bodySmall,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  focusedErrorBorder: InputBorder.none),
            )),
      ),
    );
  }
}
