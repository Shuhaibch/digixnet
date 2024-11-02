import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/drop_down/drop_down_widget.dart';
import 'package:digixnet/core/commen/widgets/radio_botton/radio_botton.dart';
import 'package:digixnet/core/commen/widgets/textfeild/title_textformfeild_widget.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/dummy_data.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/complaints/screens/complaint_screen.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  String? districtValue;
  String? locationValue;
  String? workingValue;
  String? typeValue;
  String? serviceValue;
  String? brandValue;
  String? varientValue;
  String? isServiced;
  final TextEditingController othersTypeCTRL = TextEditingController();
  final TextEditingController othersBrandCTRL = TextEditingController();
  final TextEditingController modelNOCTRL = TextEditingController();
  final TextEditingController serialNOCTRL = TextEditingController();
  final TextEditingController complaintCTRL = TextEditingController();
  final TextEditingController serviceDetailsCTRL = TextEditingController();
  String coordinates = "No Location found";
  String address = 'No Address found';
  bool scanning = false;
  bool isOtherType = false;
  bool isOtherBrand = false;
  bool isOtherVarient = false;
  bool isService = false;
  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    final localitionList = CDummyData.locationList();
    final brandList = CDummyData.brandList();
    final typeList = CDummyData.typeList();
    final productList = CDummyData.productList();
    final serviceList = CDummyData.serviceList();
    final workingList = CDummyData.workingConditionList();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            children: [
              const SizedBox(height: CSizes.appBarHeight),
              Text(
                "Create Service Request",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              CDropDownWidget(
                title: "Service Type",
                height: height,
                value: serviceValue,
                list: productList,
                bgColor: CColors.primaryColor,
                itemBuilder: (context) {
                  return serviceList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            serviceValue = value;
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
                title: "Location",
                height: height,
                value: locationValue,
                list: localitionList,
                bgColor: CColors.primaryColor,
                itemBuilder: (context) {
                  return localitionList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            locationValue = value;
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
                title: "District",
                height: height,
                value: districtValue,
                list: localitionList,
                bgColor: CColors.primaryColor,
                itemBuilder: (context) {
                  return localitionList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            locationValue = value;
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
                title: "Select Type",
                height: height,
                value: typeValue,
                list: localitionList,
                isOther: true,
                bgColor: CColors.primaryColor,
                otherOntap: () {
                  setState(() {
                    isOtherType = !isOtherType;
                    typeValue = '';
                  });
                },
                itemBuilder: (context) {
                  return typeList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            isOtherType = false;
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
              isOtherType
                  ? Column(
                      children: [
                        const SizedBox(height: CSizes.spaceBtwInputFeild),
                        TitleTextFormFeildWidget(
                          controller: othersTypeCTRL,
                          title: "Other",
                          isAuth: false,
                          hintText: "Enter the Item",
                        ),
                      ],
                    )
                  : const SizedBox(),
              Column(
                children: [
                  const SizedBox(height: CSizes.spaceBtwInputFeild),
                  CDropDownWidget(
                    title: "Select Brand",
                    height: height,
                    value: brandValue,
                    list: brandList,
                    otherOntap: () {
                      setState(() {
                        brandValue = '';
                        isOtherBrand = !isOtherBrand;
                      });
                    },
                    isOther: true,
                    bgColor: CColors.primaryColor,
                    itemBuilder: (context) {
                      return brandList.map(
                        (String value) {
                          return PopupMenuItem(
                            value: value,
                            onTap: () {
                              setState(() {
                                brandValue = value;
                                isOtherBrand = false;
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
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              isOtherBrand
                  ? Column(
                      children: [
                        TitleTextFormFeildWidget(
                          controller: othersBrandCTRL,
                          title: "Other",
                          isAuth: false,
                          hintText: "Enter the Item",
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFeild),
                      ],
                    )
                  : const SizedBox(),
              CDropDownWidget(
                title: "Select Varient",
                height: height,
                value: varientValue,
                isOther: true,
                list: productList,
                otherOntap: () {
                  setState(() {
                    varientValue = '';
                    isOtherVarient = !isOtherVarient;
                  });
                },
                bgColor: CColors.primaryColor,
                itemBuilder: (context) {
                  return productList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            varientValue = value;
                            isOtherVarient = false;
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
              isOtherVarient
                  ? Column(
                      children: [
                        TitleTextFormFeildWidget(
                          controller: othersBrandCTRL,
                          title: "Other",
                          isAuth: false,
                          hintText: "Enter the Item",
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFeild),
                      ],
                    )
                  : const SizedBox(),
              TitleTextFormFeildWidget(
                controller: modelNOCTRL,
                title: "Enter Model No",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: serialNOCTRL,
                title: "Enter Serial No",
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              TitleTextFormFeildWidget(
                controller: complaintCTRL,
                title: "Enter the Complaint",
                maxLine: null,
                isAuth: false,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              CDropDownWidget(
                title: "Working Condition",
                height: height,
                value: workingValue,
                list: workingList,
                bgColor: CColors.primaryColor,
                itemBuilder: (context) {
                  return workingList.map(
                    (String value) {
                      return PopupMenuItem(
                        value: value,
                        onTap: () {
                          setState(() {
                            workingValue = value;
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: 'Last Service or Repair in 6 Months',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: CColors.darkGreyColor)),
                    TextSpan(
                        text: " *",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: CColors.errorColor)),
                  ])),
                  const SizedBox(height: CSizes.xs),
                  Row(
                    children: [
                      Flexible(
                        child: RadioButtonWidget(
                          value: 'Yes',
                          groupValue: isServiced,
                          onChanged: (value) {
                            setState(() {
                              isService = true;

                              isServiced = value;
                            });
                          },
                          title: "Yes",
                        ),
                      ),
                      Flexible(
                        child: RadioButtonWidget(
                          value: 'No',
                          groupValue: isServiced,
                          title: "No",
                          onChanged: (value) {
                            setState(() {
                              isServiced = value;
                              isService = false;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              isService
                  ? Column(
                      children: [
                        const SizedBox(height: CSizes.spaceBtwInputFeild),
                        TitleTextFormFeildWidget(
                          controller: serviceDetailsCTRL,
                          title: "Details",
                          isAuth: false,
                          hintText: "Enter the Item",
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(height: CSizes.spaceBtwInputFeild),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ComplaintScreen(),
                  ));
                },
                child: CRoundedContainer(
                    width: double.infinity,
                    padding: const EdgeInsets.all(CSizes.defaultSpace),
                    backgroundColor: CColors.secondaryColor,
                    radius: 8,
                    child: Text(
                      " Next",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge!
                          .copyWith(color: CColors.whiteColor, fontSize: 20),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }

  checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    getLocation();
  }

  getLocation() async {
    setState(() {
      locationValue = "Loading.....";
    });

    try {
      Position position = await Geolocator.getCurrentPosition(
          // ignore: deprecated_member_use
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> result =
          await placemarkFromCoordinates(position.latitude, position.longitude);

      if (result.isNotEmpty) {
        address =
            '${result[0].name}, ${result[0].locality} ${result[0].administrativeArea}';
        setState(() {
          locationValue = result[0].locality;
        });
        // log(address);
      }
    } catch (e) {
      setState(() {
        locationValue = "";
      });
    }

    setState(() {
      scanning = false;
    });
  }
}
