import 'package:digixnet/core/commen/container/search_container.dart';
import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/commen/widgets/layout/grid_layout.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/home/screen/filter_screen.dart';
import 'package:digixnet/features/product/screens/product_screen.dart';
import 'package:digixnet/features/service/screens/service_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchCTRL = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final width = CDeviceUtils.getScreenWidth(context);
    final height = CDeviceUtils.getScreenheight(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: CSizes.appBarHeight),
            // InkWell(
            //   onTap: () {
            //     Navigator.of(context).push(
            //       MaterialPageRoute(
            //         builder: (context) => const ServiceScreen(),
            //       ),
            //     );
            //   },
            //   child: CRoundedContainer(
            //     width: double.infinity,
            //     padding: const EdgeInsets.symmetric(vertical: CSizes.md),
            //     backgroundColor: CColors.secondaryColor,
            //     radius: 8,
            //     child: Text(
            //       "Service Request",
            //       textAlign: TextAlign.center,
            //       style: Theme.of(context)
            //           .textTheme
            //           .headlineLarge!
            //           .copyWith(color: CColors.whiteColor, fontSize: 25),
            //     ),
            //   ),
            // ),
            // const SizedBox(height: CSizes.spaceBtwInputFeild),

            CSearchContainer(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              text: "Search",
              controller: searchCTRL,
              showBorder: true,
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const FilterScreen(),
                    ));
                  },
                  child: const CircleAvatar(
                    backgroundColor: CColors.secondaryColor,
                    child: Icon(Iconsax.filter, color: CColors.whiteColor),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const ServiceScreen(),
                      ),
                    );
                  },
                  child: CRoundedContainer(
                    // width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: CSizes.md, horizontal: CSizes.md),
                    backgroundColor: CColors.secondaryColor,
                    radius: 8,
                    child: Text(
                      "+ Create Request ",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: CColors.whiteColor, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: CSizes.spaceBtwInputFeild),

            CGridLayout(
              itemCount: 6,
              crossAxisSpacing: width * .02,
              mainAxisSpacing: width * .02,
              mainAxisExtent: height * .30,
              itemBuilder: (context, index) => Column(
                children: [
                  CRoundedContainer(
                    backgroundColor: CColors.primaryColor,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: CSizes.md,
                          right: CSizes.md,
                          top: 40,
                          bottom: CSizes.xs),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CRoundedImage(
                            width: width * .3,
                            height: height * .12,
                            fit: BoxFit.contain,
                            applyImageRadius: true,
                            imageUrl: CImageString.computerImg,
                            backgroundColor: CColors.blackColor,
                          ),
                          const SizedBox(height: CSizes.spaceBtwInputFeild),
                          Text(
                            "Lenovo",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            "₹ 7.800",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: CSizes.sm),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const ProductScreen(),
                      ));
                    },
                    child: CRoundedContainer(
                        width: double.infinity,
                        backgroundColor: CColors.secondaryColor,
                        padding:
                            const EdgeInsets.symmetric(vertical: CSizes.sm),
                        child: Center(
                          child: Text(
                            "Place Enquiry",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: CColors.whiteColor),
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
