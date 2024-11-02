import 'package:digixnet/core/commen/widgets/container/custom_containers.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CCustomPhoneTextFormFeild extends StatelessWidget {
  const CCustomPhoneTextFormFeild({
    this.obscureText = false,
    super.key,
    this.keyboardType,
    this.onTap,
    this.icon,
    this.suffixIcon,
    this.maxLine = 1,
    this.filled = true,
    this.isReadOnly = false,
    required this.controller,
    this.hintText,
    this.borderColor = CColors.whiteColor,
    this.backgroundColor = CColors.whiteColor,
  });
  final IconData? icon;
  final TextEditingController controller;
  final String? hintText;
  final bool filled, obscureText, isReadOnly;
  final Color borderColor;
  final Color? backgroundColor;
  final Widget? suffixIcon;
  final int? maxLine;
  final TextInputType? keyboardType;

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CCustomContainer(
          width: 50, // Adjust width as needed
          height: 53,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          backgroundColor: CColors.greyColor,
          child: Center(
            child: Text(
              "+91",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(backgroundColor: CColors.greyColor),
            ),
          ),
        ),
        Flexible(
            child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.phone,
          onTap: onTap,
          maxLength: 10,
          decoration: InputDecoration(
            fillColor: backgroundColor,
            filled: true,
            enabledBorder: const OutlineInputBorder().copyWith(
                borderSide: const BorderSide(color: CColors.primaryColor),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            focusedBorder: const OutlineInputBorder().copyWith(
                borderSide: const BorderSide(color: CColors.primaryColor),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
            border: const OutlineInputBorder().copyWith(
                borderSide: const BorderSide(color: CColors.primaryColor),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8))),
          ),
        )),
      ],
    );
  }
}
