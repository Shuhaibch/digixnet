// ignore_for_file: use_build_context_synchronously

import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/image/image_handler.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/core/commen/widgets/textfeild/title_textformfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:image_picker/image_picker.dart';

class ComplaintScreen extends StatefulWidget {
  const ComplaintScreen({super.key});

  @override
  State<ComplaintScreen> createState() => _ComplaintScreenState();
}

class _ComplaintScreenState extends State<ComplaintScreen> {
  final TextEditingController complaintCTRL = TextEditingController();
  final TextEditingController workinStatusCTRL = TextEditingController();
  final TextEditingController latestServiceDetailsCTRL =
      TextEditingController();
  final TextEditingController fImgCTRL = TextEditingController();
  final TextEditingController bImgCTRL = TextEditingController();
  final TextEditingController sImg1CTRL = TextEditingController();
  final TextEditingController sImg2CTRL = TextEditingController();
  final TextEditingController phoneCTRL = TextEditingController();
  bool isVisible = true;
  bool isTerms = false;
  XFile? frontImg, sideImg1, sideImg2, bottomImg;
  final picker = ImagePicker();

  @override
  void dispose() {
    super.dispose();
    complaintCTRL.dispose();
    sImg2CTRL.dispose();
    workinStatusCTRL.dispose();
    latestServiceDetailsCTRL.dispose();
    fImgCTRL.dispose();
    bImgCTRL.dispose();
    sImg1CTRL.dispose();
    phoneCTRL.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: CSizes.appBarHeight),
              Text(
                "Add Complaint Details",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: complaintCTRL,
                title: "Complaint",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: workinStatusCTRL,
                title: "Working Status",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: latestServiceDetailsCTRL,
                title: "Last Service Details",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: fImgCTRL,
                isPhoto: true,
                onTap: () {
                  showbottomSheet(context, height, frontImg, fImgCTRL);
                },
                title: "Upload Front Image",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: sImg1CTRL,
                isPhoto: true,
                title: "Upload Side Image 1",
                onTap: () {
                  showbottomSheet(context, height, sideImg1, sImg1CTRL);
                },
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: sImg2CTRL,
                isPhoto: true,
                title: "Upload Side Image 2",
                isAuth: false,
                onTap: () {
                  showbottomSheet(context, height, sideImg2, sImg2CTRL);
                },
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: bImgCTRL,
                isPhoto: true,
                title: "Upload Bottom Image",
                isAuth: false,
                onTap: () {
                  showbottomSheet(context, height, bottomImg, bImgCTRL);
                },
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: phoneCTRL,
                title: "Alternate Phone Number",
                isAuth: false,
                isPhone: true,
                bgColor: CColors.primaryColor,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              Row(
                children: [
                  Checkbox(
                    value: isTerms,
                    onChanged: (value) {
                      setState(() {
                        isTerms = !isTerms;
                      });
                    },
                  ),
                  Text('Accept the Terms & Conditions',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: CColors.blackColor)),
                ],
              ),
              InkWell(
                onTap: () {},
                child: CRoundedContainer(
                  width: double.infinity,
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  backgroundColor: CColors.secondaryColor,
                  radius: 8,
                  child: Center(
                    child: Text(
                      " Submit",
                      // textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: CColors.whiteColor, fontSize: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * .01,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showbottomSheet(BuildContext context, double height,
      XFile? pickedFile, TextEditingController controller) {
    return showFlexibleBottomSheet(
      // barrierColor: Colors.transparent,
      bottomSheetColor: Colors.white10,

      bottomSheetBorderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      minHeight: 0,
      initHeight: 0.8,
      maxHeight: 0.8,
      context: context,
      builder: (context, scrollController, bottomSheetOffset) {
        return Material(
          color: CColors.primaryColor,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5),
              ),
            ),
            height: height * .3,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Select the source of image',
                    style: TextStyle(
                      color: CColors.blackColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: .1),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 38.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () async {
                            final XFile? image =
                                await CImageHander.imageHandler(
                                    context, ImageSource.camera);
                            setState(() {
                              pickedFile = image;
                              controller.text = pickedFile!.name;
                            });
                            Navigator.of(context).pop();
                          },
                          child: const CRoundedContainer(
                            height: 100,
                            width: 110,
                            showBorder: true,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.camera,
                              size: 40,
                              color: CColors.secondaryColor,
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            final XFile? image =
                                await CImageHander.imageHandler(
                                    context, ImageSource.gallery);
                            setState(() {
                              pickedFile = image;
                            });
                            Navigator.of(context).pop();
                          },
                          child: const CRoundedContainer(
                            height: 100,
                            width: 110,
                            showBorder: true,
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.browse_gallery,
                              size: 40,
                              color: CColors.secondaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: .02),
                ],
              ),
            ),
          ),
        );
      },
      isExpand: false,
    );
  }
}
