import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/auth/screens/login_screen.dart';
import 'package:digixnet/features/auth/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = CDeviceUtils.getScreenWidth(context);
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      body: Column(
        children: [
          CRoundedContainer(
            backgroundColor: CColors.whiteColor,
            radius: 0,
            height: height * .45,
            child: const Center(
              child: CRoundedImage(imageUrl: CImageString.appLogo),
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
              child: CRoundedContainer(
                backgroundColor: CColors.primaryColor,
                // child: Text('data'),
                padding: const EdgeInsets.all(CSizes.defaultSpace),
                radius: 0,
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(width * .03),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          child: CRoundedContainer(
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.all(CSizes.defaultSpace),
                              backgroundColor: CColors.secondaryColor,
                              radius: 50,
                              child: Text(
                                "Register with Us",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: CColors.whiteColor,
                                        fontSize: 20),
                              )),
                        ),
                        const SizedBox(height: CSizes.spaceBtwInputFeild),
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
                              padding:
                                  const EdgeInsets.all(CSizes.defaultSpace),
                              backgroundColor: CColors.secondaryColor,
                              radius: 50,
                              child: Text(
                                " Login",
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: CColors.whiteColor,
                                    ),
                              )),
                        ),
                      ],
                    ),
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
