import 'dart:developer';

import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/drop_down/drop_down_widget.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/dummy_data.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/auth/screens/login_screen.dart';
import 'package:digixnet/core/commen/widgets/textfeild/title_textformfeild_widget.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController emailCTRL = TextEditingController();
  final TextEditingController phoneCTRL = TextEditingController();
  final TextEditingController nameCTRL = TextEditingController();
  final TextEditingController addressCTRL = TextEditingController();
  final TextEditingController pincodeCTRL = TextEditingController();
  final TextEditingController locationCTRL = TextEditingController();
  final TextEditingController passwordCTRL = TextEditingController();
  bool isVisible = true;
  String? districtValue;

  String coordinates = "No Location found";
  String address = 'No Address found';
  bool scanning = false;
  @override
  void initState() {
    super.initState();
    checkPermission();
  }

  checkPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    print(serviceEnabled);

    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    permission = await Geolocator.checkPermission();

    print(permission);

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
      locationCTRL.text = "Loading.....";
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
          locationCTRL.text = result[0].locality??'';
        });
        log(address);
      }
    } catch (e) {
      setState(() {
        locationCTRL.text = "";
      });
    }

    setState(() {
      scanning = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailCTRL.dispose();
    passwordCTRL.dispose();
    phoneCTRL.dispose();
    nameCTRL.dispose();
    addressCTRL.dispose();
    pincodeCTRL.dispose();
    locationCTRL.dispose();
    districtValue == null;
  }

  @override
  Widget build(BuildContext context) {
    final height = CDeviceUtils.getScreenheight(context);
    final localitionList = CDummyData.locationList();
    return Scaffold(
      backgroundColor: CColors.primaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TitleTextFormFeildWidget(
                  controller: nameCTRL,
                  title: "Fullname",
                  icon: Icons.person_2_outlined,
                ),
                const SizedBox(height: CSizes.sm),
                TitleTextFormFeildWidget(
                  controller: emailCTRL,
                  title: "Email",
                  icon: Icons.email_outlined,
                ),
                const SizedBox(height: CSizes.sm),
                TitleTextFormFeildWidget(
                  isPhone: true,
                  controller: phoneCTRL,
                  bgColor: CColors.whiteColor,
                  title: "Phone No",
                  icon: Icons.call,
                  keyboardType: TextInputType.phone,
                ),
                // const SizedBox(height: CSizes.spaceBtwInputFeild),
                CDropDownWidget(
                  title: "District",
                  height: height,
                  value: districtValue,
                  list: localitionList,
                  itemBuilder: (context) {
                    return localitionList.map(
                      (String value) {
                        return PopupMenuItem(
                          value: value,
                          onTap: () {
                            setState(() {
                              districtValue = value;
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
                TitleTextFormFeildWidget(
                  controller: locationCTRL,
                  title: "Location",
                  icon: Icons.location_on_outlined,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TitleTextFormFeildWidget(
                  controller: addressCTRL,
                  title: "Address",
                  icon: Icons.home_outlined,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TitleTextFormFeildWidget(
                  controller: pincodeCTRL,
                  title: "Pin code",
                  icon: Icons.padding,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFeild),
                TitleTextFormFeildWidget(
                  controller: passwordCTRL,
                  title: "Password",
                  icon: Icons.lock_outline,
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          isVisible = !isVisible;
                        });
                      },
                      child: Icon(isVisible
                          ? Icons.remove_red_eye
                          : Icons.visibility_off)),
                ),
                const SizedBox(height: CSizes.spaceBtwSection),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: CRoundedContainer(
                      width: double.infinity,
                      padding: const EdgeInsets.all(CSizes.defaultSpace),
                      backgroundColor: CColors.secondaryColor,
                      radius: 8,
                      child: Text(
                        " Register",
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
      ),
    );
  }
}
