import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/icon/circular_icon.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  int count = 0;
  int total = 0;
  @override
  Widget build(BuildContext context) {
    final width = CDeviceUtils.getScreenWidth(context);
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: CSizes.appBarHeight),
            SizedBox(
              height: height * .4,
              width: width,
              child: Stack(
                children: [
                  const Align(
                    alignment: Alignment.bottomCenter,
                    child: CRoundedImage(
                      backgroundColor: Colors.transparent,
                      fit: BoxFit.contain,
                      imageUrl: CImageString.shadowImg,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding: EdgeInsets.only(top: height * .07),
                      child: CRoundedImage(
                        // padding: EdgeInsets.only(),
                        backgroundColor: Colors.transparent,
                        fit: BoxFit.cover,
                        imageUrl: CImageString.comlgImg,
                        height: height * .28,
                      ),
                    ),
                  ),
                  Positioned(
                    right: width * .035,
                    top: height * .03,
                    child: const CRoundedContainer(
                      backgroundColor: CColors.errorColor,
                      radius: 8,
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Text(
                        "Refurbished",
                        style: TextStyle(color: CColors.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: CSizes.defaultSpace * 2),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Lenovo",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        "₹ 9500",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  Text(
                    'IdeaPad Slim 3i 12th Gen (15,Intel) >  39.62cms -IdeaPad Slim 3i 12th Gen, Intel i3 (Arctic Grey)',
                    maxLines: null,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: CSizes.spaceBtwItem),
                  Row(
                    children: [
                      CCircularIcon(
                          icon: Icons.remove,
                          backgroundColor: Colors.transparent,
                          width: 40,
                          height: 40,
                          color: CColors.darkerGreyColor,
                          onPressed: () {
                            setState(() {
                              if (count == 0) {
                                return;
                              }
                              count--;
                              total = total - 9500;
                            });
                          }),
                      const SizedBox(width: CSizes.spaceBtwItem),
                      Text(count.toString(),
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(width: CSizes.spaceBtwItem),
                      CCircularIcon(
                        icon: Iconsax.add_copy,
                        backgroundColor: Colors.transparent,
                        borderColor: CColors.secondaryColor,
                        width: 40,
                        height: 40,
                        color: CColors.secondaryColor,
                        onPressed: () {
                          setState(() {
                            count++;
                            total = total + 9500;
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: CSizes.spaceBtwSection),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Amount :  ",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                      Text(
                        total.toString(),
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ],
                  ),
                  SizedBox(height: height * .1),
                  InkWell(
                    onTap: () {
                      // Navigator.of(context).pushAndRemoveUntil(
                      //   MaterialPageRoute(
                      //     builder: (context) => const MainScreen(),
                      //   ),
                      //   (route) => false,
                      // );
                    },
                    child: CRoundedContainer(
                      width: double.infinity,
                      padding: const EdgeInsets.all(CSizes.defaultSpace),
                      backgroundColor: CColors.secondaryColor,
                      radius: 8,
                      child: Center(
                        child: Text(
                          " Send Enquiry",
                          // textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(
                                  color: CColors.whiteColor, fontSize: 20),
                        ),
                      ),
                    ),
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
