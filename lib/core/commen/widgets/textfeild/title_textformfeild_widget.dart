import 'package:digixnet/core/commen/widgets/text/custom_phone_text_widget.dart';
import 'package:digixnet/core/commen/widgets/text/custom_text_widget.dart';
import 'package:digixnet/core/commen/widgets/textfeild/complaint_text_form_feild.dart';
import 'package:digixnet/core/commen/widgets/textfeild/photo_text_feild_widget.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class TitleTextFormFeildWidget extends StatelessWidget {
  const TitleTextFormFeildWidget({
    super.key,
    this.isPhoto = false,
    this.isPhone = false,
    required this.controller,
    this.suffixIcon,
    this.icon,
    this.hintText,
    this.keyboardType,
    this.obscureText = false,
    this.isAuth = true,
    this.maxLine,
    this.title,
    this.bgColor,
    this.onTap,
  });
  final IconData? icon;
  final TextEditingController controller;
  final String? hintText, title;
  final bool obscureText, isPhone, isAuth, isPhoto;
  final TextInputType? keyboardType;
  final Color? bgColor;
  final Widget? suffixIcon;
  final int? maxLine;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
            text: TextSpan(children: [
          TextSpan(
              text: title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: CColors.darkGreyColor)),
          TextSpan(
              text: " *",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: CColors.errorColor)),
        ])),
        const SizedBox(height: CSizes.xs),
        isPhone
            ? CCustomPhoneTextFormFeild(
                keyboardType: TextInputType.phone,
                controller: controller,
                icon: icon,
                hintText: hintText,
                suffixIcon: suffixIcon,
                backgroundColor: bgColor,
              )
            : isAuth
                ? CCustomTextFormFeild(
                    keyboardType: keyboardType,
                    controller: controller,
                    backgroundColor: CColors.whiteColor,
                    icon: isAuth ? icon : null,
                    hintText: hintText,
                    suffixIcon: suffixIcon,
                  )
                : isPhoto
                    ? CPhotoTextFeildWidget(
                        controller: controller,
                        obscureText: obscureText,
                        bgColor: bgColor,
                        onTap: onTap,
                      )
                    : ComplaintTextFormFeild(
                        controller: controller,
                        maxLine: maxLine,
                      )
      ],
    );
  }
}
