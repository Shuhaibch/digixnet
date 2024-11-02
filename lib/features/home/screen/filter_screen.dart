import 'package:digixnet/core/commen/widgets/drop_down/drop_down_widget.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/dummy_data.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  String? districtValue;
  String? locationValue;
  String? typeValue;
  String? priceValue;
  String? brandValue;
  String? varientValue;
  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    final priceList = CDummyData.priceList();
    final brandList = CDummyData.brandList();
    final typeList = CDummyData.typeList();
    final varientList = CDummyData.varientList();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: CSizes.appBarHeight * 2),
            InkWell(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: const CircleAvatar(
                backgroundColor: CColors.secondaryColor,
                child: Icon(Icons.close, color: CColors.whiteColor),
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),
            CDropDownWidget(
              title: "Filter by type",
              isFilter: true,
              height: height,
              value: typeValue,
              list: typeList,
              bgColor: CColors.primaryColor,
              itemBuilder: (context) {
                return typeList.map(
                  (String value) {
                    return PopupMenuItem(
                      value: value,
                      onTap: () {
                        setState(() {
                          typeValue = value;
                        });
                      },
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ).toList();
              },
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),
            CDropDownWidget(
              title: "Filter by Brand",
              isFilter: true,
              height: height,
              value: brandValue,
              list: varientList,
              bgColor: CColors.primaryColor,
              itemBuilder: (context) {
                return brandList.map(
                  (String value) {
                    return PopupMenuItem(
                      value: value,
                      onTap: () {
                        setState(() {
                          brandValue = value;
                        });
                      },
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ).toList();
              },
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),
            CDropDownWidget(
              title: "Filter by Varient",
              isFilter: true,
              height: height,
              value: varientValue,
              list: varientList,
              bgColor: CColors.primaryColor,
              itemBuilder: (context) {
                return varientList.map(
                  (String value) {
                    return PopupMenuItem(
                      value: value,
                      onTap: () {
                        setState(() {
                          varientValue = value;
                        });
                      },
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ).toList();
              },
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),
            CDropDownWidget(
              title: "Price Range",
              isFilter: true,
              height: height,
              value: priceValue,
              list: priceList,
              bgColor: CColors.primaryColor,
              itemBuilder: (context) {
                return priceList.map(
                  (String value) {
                    return PopupMenuItem(
                      value: value,
                      onTap: () {
                        setState(() {
                          priceValue = value;
                        });
                      },
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    );
                  },
                ).toList();
              },
            ),
          ],
        ),
      ),
    );
  }
}
