import 'package:digixnet/core/commen/widgets/container/custom_containers.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:flutter/material.dart';

class CPhotoTextFeildWidget extends StatelessWidget {
  const CPhotoTextFeildWidget({
    super.key,
    required this.controller,
    required this.obscureText,
    required this.bgColor,
    this.onTap,
  });

  final TextEditingController controller;
  final bool obscureText;
  final Color? bgColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final width = CDeviceUtils.getScreenWidth(context);
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: CCustomContainer(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
            backgroundColor: CColors.secondaryColor,
            height: 53,
            width: width * .15,
            child: Center(
              child: Text("Choose File",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CColors.whiteColor)),
            ),
          ),
        ),
        Flexible(
            child: TextFormField(
          controller: controller,
          readOnly: true,
          decoration: InputDecoration(
            fillColor: CColors.primaryColor,
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
