import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    final width = CDeviceUtils.getScreenWidth(context);
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: width,
            height: height * .401,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: CRoundedImage(
                    height: height * .29,
                    imageUrl: CImageString.profileBg,
                    width: width,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: CircleAvatar(
                    maxRadius: width * .1,
                    backgroundColor: CColors.whiteColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CRoundedImage(
                        height: height * .2,
                        backgroundColor: CColors.whiteColor,
                        applyImageRadius: true,
                        borderRadius: 50,
                        imageUrl: CImageString.userImg,
                        width: width * .5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height * 0.1),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50)),
              child: CRoundedContainer(
                width: double.infinity,
                backgroundColor: CColors.primaryColor,
                radius: 0,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: CSizes.defaultSpace * 2,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        // width: width * .25,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.location_on_rounded,
                                  color: CColors.darkerGreyColor,
                                ),
                                const SizedBox(width: CSizes.sm),
                                Text('Kowdiar,Trivandrum, \nKerala 695612',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: CColors.darkerGreyColor)),
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFeild),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.phone,
                                  color: CColors.darkerGreyColor,
                                ),
                                const SizedBox(width: CSizes.sm),
                                Text('+91 - 6238769090',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: CColors.darkerGreyColor)),
                                // const SizedBox(width: CSizes.sm),
                              ],
                            ),
                            const SizedBox(height: CSizes.spaceBtwInputFeild),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(
                                  Icons.mail,
                                  color: CColors.darkerGreyColor,
                                ),
                                const SizedBox(width: CSizes.sm),
                                Text('Elza@gmail.com',
                                    maxLines: 2,
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                            color: CColors.darkerGreyColor)),
                              ],
                            ),
                            SizedBox(height: height * .08),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 40.0),
                            child: Text('Edit profile'),
                          ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
