import 'package:digixnet/core/commen/widgets/container/custom_containers.dart';
import 'package:digixnet/core/commen/widgets/icon/circular_icon.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/service/widgets/service_details_text_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class ServiceBookingDetailsScreen extends StatelessWidget {
  const ServiceBookingDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    final width = CDeviceUtils.getScreenWidth(context);
    // final imageList = [
    //   CImageString.profileBg,
    //   CImageString.comlgImg,
    // ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CCustomContainer(
              width: double.infinity,
              backgroundColor: CColors.primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    vertical: CSizes.defaultSpace, horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: CSizes.appBarHeight),
                    ServiceDetailsTextRowWidget(
                      icon: Icons.miscellaneous_services_outlined,
                      title: 'Service No ',
                      subtitle: "DG_22014",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.designtools5,
                      title: 'Model No',
                      subtitle: "13GHZLK",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.designtools5,
                      title: 'Serial No',
                      subtitle: "LenSerod6",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.barcode,
                      title: 'Brand',
                      subtitle: "Lenovo",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.barcode,
                      title: 'Varient',
                      subtitle: "IdeaPad",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.money,
                      title: 'Service Amount',
                      subtitle: "3500",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Icons.calendar_month_outlined,
                      title: 'Date',
                      subtitle: "13 Apr 2024",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Icons.timelapse_rounded,
                      title: 'Time',
                      subtitle: "09:00 Am",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.watch_status,
                      title: 'Status',
                      subtitle: "Completed",
                      textColor: Colors.green,
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.gift,
                      title: 'Item',
                      subtitle: "Lenovo 13GHZ",
                    ),
                    SizedBox(height: CSizes.defaultSpace),
                    ServiceDetailsTextRowWidget(
                      icon: Iconsax.note_1,
                      title: 'Note',
                      isNote: true,
                      subtitle:
                          "Technical support for your Lenovo Products IdeaPad Slim 3i 12th Gen ",
                    ),
                    // SizedBox(height: CSizes.defaultSpace),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              child: SizedBox(
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: CCircularIcon(
                          icon: Icons.keyboard_arrow_left_rounded,
                          backgroundColor: CColors.secondaryColor,
                          width: 40,
                          height: 40,
                          borderColor: CColors.secondaryColor,
                          color: CColors.whiteColor,
                          onPressed: () {}),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CCircularIcon(
                          icon: Icons.keyboard_arrow_right_outlined,
                          backgroundColor: CColors.secondaryColor,
                          width: 40,
                          height: 40,
                          borderColor: CColors.secondaryColor,
                          color: CColors.whiteColor,
                          onPressed: () {}),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
