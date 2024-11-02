import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:flutter/material.dart';

class ApplyJobTextFormFeild extends StatelessWidget {
  const ApplyJobTextFormFeild(
      {super.key,
      required this.width,
      this.icon,
      this.readOnly = false,
      this.suffixIcon,
      required this.controller,
      required this.hintText,
      this.obscureText = false,
      this.suffixColor = CColors.whiteColor,
      required this.title,
      this.validator, this.keyboardType});

  final double width;
  final IconData? icon, suffixIcon;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final String hintText, title;
  final bool obscureText, readOnly;
  final Color suffixColor;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(color: CColors.blackColor),
        ),
        TextFormField(
          validator: validator,
          keyboardType:keyboardType ,
          readOnly: readOnly,
          controller: controller,
          cursorColor: CColors.blackColor,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: CColors.blackColor),
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            counterStyle: const TextStyle(color: CColors.blackColor),
            suffixIcon: Padding(
              padding: EdgeInsets.only(top: height * .015),
              child: Text(
                "USD",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: CColors.blackColor,
                    ),
              ),
            ),
            hintText: hintText,
            errorStyle: Theme.of(context).inputDecorationTheme.errorStyle,
            hintStyle: Theme.of(context)
                .inputDecorationTheme
                .hintStyle!
                .copyWith(color: CColors.whiteColor),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: CColors.darkGreyColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8))),
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: CColors.darkGreyColor),
                borderRadius: BorderRadius.all(Radius.circular(8))),
          ),
        ),
      ],
    );
  }
}
