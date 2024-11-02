import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class SalesEnquiryDetailsScreen extends StatelessWidget {
  const SalesEnquiryDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      backgroundColor: CColors.primaryColor,
      body: Column(
        children: [
          const SizedBox(height: CSizes.appBarHeight),
          Container(
              color: CColors.primaryColor,
              child: Padding(
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                child: CRoundedContainer(
                  borderColor: CColors.whiteColor,
                  padding: const EdgeInsets.symmetric(
                      vertical: CSizes.defaultSpace, horizontal: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: CSizes.defaultSpace),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CRoundedContainer(
                                backgroundColor: CColors.errorColor,
                                radius: 8,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                child: Text(
                                  "Refurbished",
                                  style: TextStyle(color: CColors.whiteColor),
                                ),
                              ),
                            ],
                          ),
                          CRoundedImage(
                            // padding: EdgeInsets.only(),
                            backgroundColor: Colors.transparent,
                            fit: BoxFit.cover,
                            imageUrl: CImageString.comlgImg,
                            height: height * .25,
                          ),
                          Text(
                            "Lenovo 13GHZ",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          const SizedBox(height: CSizes.spaceBtwItem),
                          Text(
                            'This laptop has a 15.6″ screen with an HD resolution of 1920 x 1080 pixels. It comes with an Intel Core i5 processor and 8GB of RAM.',
                            maxLines: null,
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          const SizedBox(height: CSizes.spaceBtwSection),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Text(
                          //       ' Service No : DG_20214',
                          //       maxLines: null,
                          //       style: Theme.of(context)
                          //           .textTheme
                          //           .displaySmall!
                          //           .copyWith(fontSize: 17),
                          //     ),
                          //     // Row(
                          //     //   children: [
                          //     //     const CCircularContainer(
                          //     //       height: 20,
                          //     //       width: 20,
                          //     //       backgroundColor: Colors.green,
                          //     //     ),
                          //     //     Text(
                          //     //       ' Completed',
                          //     //       maxLines: null,
                          //     //       style: Theme.of(context)
                          //     //           .textTheme
                          //     //           .displaySmall!
                          //     //           .copyWith(fontSize: 17),
                          //     //     ),
                          //     //   ],
                          //     // )
                          //   ],
                          // ),
                        ],
                      ),
                      Text(
                        ' Item Quantity : 5',
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 17),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItem),
                      Text(
                        ' Supplier Name : DG_20214',
                        maxLines: null,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 17),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItem),
                      Text(
                        ' Amount : 500',
                        maxLines: null,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 17),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItem),
                      Text(
                        ' Status : Completed',
                        maxLines: null,
                        style: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
