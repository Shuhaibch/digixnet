import 'package:digixnet/core/commen/widgets/container/circular_container.dart';
import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/enqiury/widgets/sales_ennquiries_tile_widget.dart';
import 'package:digixnet/features/enqiury/widgets/widgets.service_booking_tile_widget.dart';
import 'package:flutter/material.dart';

class EnqiuryScreen extends StatelessWidget {
  const EnqiuryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            const SizedBox(height: CSizes.appBarHeight),
            TabBar(
              dividerColor: Colors.transparent,
              indicatorColor: CColors.primaryColor,
              labelColor: CColors.blackColor,
              indicatorPadding: const EdgeInsets.all(0),
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontSize: 18),
              labelPadding: EdgeInsets.only(top: height * .01),
              indicatorWeight: height * .015,
              indicator: const BoxDecoration(
                  color: CColors.primaryColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              tabs: const [
                Text('Service Bookings'),
                Text('Sales Enquiries'),
              ],
            ),
            Expanded(
              child: TabBarView(children: [
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return ServiceBookingTileWidget(index: index);
                  },
                ),
                ListView.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int index) {
                    return SalesEnquiriesTileWidget(index: index);
                  },
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}