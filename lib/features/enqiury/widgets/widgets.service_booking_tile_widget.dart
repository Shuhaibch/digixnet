import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/service/screens/service_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ServiceBookingTileWidget extends StatelessWidget {
  const ServiceBookingTileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: CColors.primaryColor,
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            const ServiceBookingDetailsScreen(),
                      ),
                    );
                  },
                  child: CRoundedContainer(
                    radius: 10,
                    backgroundColor: CColors.secondaryColor,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    child: Text(
                      "View",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: CColors.whiteColor),
                    ),
                  ),
                ),
                const SizedBox(width: CSizes.sm),
                CRoundedContainer(
                  height: 33,
                  width: 34,
                  radius: 10,
                  backgroundColor: index % 2 == 0
                      ? CupertinoColors.activeGreen
                      : index % 3 == 0
                          ? CColors.errorColor
                          : Colors.blue,
                )
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwItem),
            CRoundedContainer(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.defaultSpace, vertical: 30),
              backgroundColor: CColors.whiteColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          "Service No : DG_0124",
                          style: Theme.of(context).textTheme.titleLarge,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Flexible(
                      //   child: Text(
                      //     "Status : Completed",
                      //     overflow: TextOverflow.ellipsis,
                      //     style: Theme.of(context).textTheme.titleLarge,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  Text(
                    "Type : Battery Replacement",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  Text(
                    "Vendor Name : AXNOL ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  Text(
                    "Item : Laptop",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  // const SizedBox(height: CSizes.spaceBtwItem),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
