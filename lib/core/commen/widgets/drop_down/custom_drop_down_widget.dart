import 'package:digixnet/core/utils/color/colors.dart';
import 'package:flutter/material.dart';

class CDropDownFeild extends StatelessWidget {
  const CDropDownFeild({
    this.icon = Icons.keyboard_arrow_down,
    super.key,
    this.isBlogScreen = false,
    required this.hintText,
    this.dropdownTextColor = CColors.whiteColor,
    this.dropdownColor = CColors.primaryColor,
    this.titleSize = 12,
    required this.value,
    this.hintSize = 16,
    this.textSize = 16,
    this.radius = 6,
    this.hintColor = CColors.whiteColor,
    this.borderColor = CColors.whiteColor,
    required this.items,
    this.onChanged,
    this.borderWidth = 1.5,
    this.textColor = CColors.whiteColor,
    // required this.validator,
  });
  final String hintText;
  final IconData icon;
  final String? value;
  final bool isBlogScreen;
  final double hintSize, radius, borderWidth, textSize, titleSize;
  final Color hintColor,
      borderColor,
      textColor,
      dropdownColor,
      dropdownTextColor;
  final List<String> items;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        isBlogScreen
            ? const SizedBox()
            : Icon(icon,
                color:
                    isBlogScreen ? CColors.primaryColor : CColors.whiteColor),
        Flexible(
          child: DropdownButtonFormField(
            
              selectedItemBuilder: (context) {
                return items.map((String item) {
                  return DropdownMenuItem(
                    value: item,
                    child: Text(
                      item,
                      style: TextStyle(color: dropdownTextColor),
                    ),
                  );
                }).toList();
              },
              isExpanded: true,
              hint: Text(
                hintText,
                style: TextStyle(
                  color: hintColor,
                  fontSize: hintSize,
                  letterSpacing: 0.8,
                ),
              ),
              style: TextStyle(
                color: textColor,
                fontSize: textSize,
              ),
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.arrow_drop_down_sharp),
                  enabledBorder: isBlogScreen
                      ? Theme.of(context)
                          .inputDecorationTheme
                          .enabledBorder!
                          .copyWith(borderSide: BorderSide(color: borderColor))
                      : const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CColors.secondaryColor, width: 2)),
                  focusedBorder: isBlogScreen
                      ? Theme.of(context)
                          .inputDecorationTheme
                          .focusedBorder!
                          .copyWith(borderSide: BorderSide(color: borderColor))
                      : const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CColors.secondaryColor, width: 2)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  border: isBlogScreen
                      ? Theme.of(context)
                          .inputDecorationTheme
                          .border!
                          .copyWith(borderSide: BorderSide(color: borderColor))
                      : const UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: CColors.secondaryColor, width: 2))),
              value: value,
              
              icon:null, 
              
              dropdownColor: dropdownColor,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select an option';
                }
                return null;
              },
              isDense: true,
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom:
                                  BorderSide(color: CColors.secondaryColor))),
                      child: Text(
                        item,
                        style: TextStyle(color: dropdownTextColor),
                      )),
                );
              }).toList(),
              onChanged: onChanged),
        ),
      ],
    );
  }
}
