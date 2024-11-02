import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CAppbar({
    super.key,
    this.title,
    this.showDivider = true,
    this.showBackArrow = false,
    this.iconColor = CColors.whiteColor,
    this.leadingIcon,
    this.backgroungColor = Colors.transparent,
    this.centerTitle = true,
    this.padding = 0,
    this.actions,
    this.leadingOnPressed,
    this.dividerColor = CColors.primaryColor,
  });

  final Widget? title;
  final bool showBackArrow, centerTitle, showDivider;
  final Color iconColor, backgroungColor, dividerColor;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: AppBar(
        backgroundColor: backgroungColor,
        automaticallyImplyLeading: false,
        centerTitle: centerTitle,
        bottom: showDivider
            ? PreferredSize(
                preferredSize: preferredSize,
                child: Divider(
                  color: dividerColor,
                ))
            : null,
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Iconsax.arrow_left, color: iconColor))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed,
                    icon: Icon(leadingIcon),
                    color: iconColor,
                  )
                : null,
        title: title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(CDeviceUtils.getAppBarHeight());
}
