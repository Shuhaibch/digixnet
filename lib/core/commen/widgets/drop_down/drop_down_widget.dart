import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class CDropDownWidget extends StatelessWidget {
  const CDropDownWidget({
    super.key,
    required this.height,
    required this.value,
    required this.list,
    this.isFilter = false,
    this.isOther = false,
    required this.itemBuilder,
    this.title,
    this.bgColor = CColors.whiteColor,
    this.otherOntap,
  });

  final double height;
  final bool isFilter, isOther;
  final String? value;
  final Color bgColor;
  final String? title;
  final List<String> list;
  final List<PopupMenuEntry<String>> Function(BuildContext) itemBuilder;
  final void Function()? otherOntap;
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
          isFilter
              ? TextSpan(
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CColors.errorColor))
              : TextSpan(
                  text: " *",
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: CColors.errorColor)),
        ])),
        const SizedBox(height: CSizes.xs),
        PopupMenuButton(
            padding: const EdgeInsets.all(0),
            icon: CRoundedContainer(
              radius: 8,
              padding: EdgeInsets.symmetric(vertical: height * .015),
              backgroundColor: bgColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.0),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 25,
                        ),
                      ),
                      Text(value ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: CColors.blackColor)),
                    ],
                  ),
                  isOther
                      ? Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: InkWell(
                            onTap: otherOntap,
                            child: Text("Other",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: CColors.blackColor)),
                          ),
                        )
                      : const SizedBox()
                ],
              ),
            ),
            color: CColors.whiteColor,
            position: PopupMenuPosition.under,
            constraints: const BoxConstraints.tightFor(),
            itemBuilder: itemBuilder),
      ],
    );
  }
}
