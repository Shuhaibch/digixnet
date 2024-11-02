import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/enqiury/screens/sales_enquiry_details_screen.dart';
import 'package:flutter/material.dart';

class SalesEnquiriesTileWidget extends StatelessWidget {
  const SalesEnquiriesTileWidget({
    super.key,
    required this.index,
  });
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => SalesEnquiryDetailsScreen(),
        ));
      },
      child: Container(
        color: CColors.primaryColor,
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     InkWell(
              //       onTap: () {
              //         Navigator.of(context).push(
              //           MaterialPageRoute(
              //             builder: (context) => const ServiceDetailsScreen(),
              //           ),
              //         );
              //       },
              //       child: CRoundedContainer(
              //         radius: 10,
              //         backgroundColor: CColors.secondaryColor,
              //         padding:
              //             const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              //         child: Text(
              //           "View",
              //           style: Theme.of(context)
              //               .textTheme
              //               .titleLarge!
              //               .copyWith(color: CColors.whiteColor),
              //         ),
              //       ),
              //     ),
              //     const SizedBox(width: CSizes.sm),
              //     CRoundedContainer(
              //       height: 33,
              //       width: 34,
              //       radius: 10,
              //       backgroundColor: index % 2 == 0
              //           ? CupertinoColors.activeGreen
              //           : index % 3 == 0
              //               ? CColors.errorColor
              //               : Colors.blue,
              //     )
              //   ],
              // ),
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
                            "Enquiry NO : ENQ9874",
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: CSizes.spaceBtwItem),
                    Text(
                      "Date : 04/05/5548",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: CSizes.spaceBtwItem),
                    Text(
                      "Item : Laptop",
                      style: Theme.of(context).textTheme.titleLarge,
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
                    // const SizedBox(height: CSizes.spaceBtwItem),

                    // const SizedBox(height: CSizes.spaceBtwItem),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
