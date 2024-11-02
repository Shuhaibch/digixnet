import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/commen/widgets/image/rounded_image_container.dart';
import 'package:digixnet/core/commen/widgets/text/custom_text_widget.dart';
import 'package:digixnet/core/utils/color/colors.dart';
import 'package:digixnet/core/utils/constants/image_string.dart';
import 'package:digixnet/core/utils/device/device_util.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/main_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailPhoneCTRL = TextEditingController();
  final TextEditingController passwordCTRL = TextEditingController();
  bool isVisible = true;
  @override
  void dispose() {
    super.dispose();
    emailPhoneCTRL.dispose();
    passwordCTRL.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = CDeviceUtils.getScreenWidth(context);
    final height = CDeviceUtils.getScreenheight(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CRoundedContainer(
              backgroundColor: CColors.whiteColor,
              radius: 0,
              height: height * .4,
              child: const Center(
                child: Center(
                  child: CRoundedImage(imageUrl: CImageString.appLogo),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  child: CRoundedContainer(
                    backgroundColor: CColors.primaryColor,
                    radius: 0,
                    padding: const EdgeInsets.symmetric(
                      vertical: CSizes.defaultSpace,
                      horizontal: CSizes.defaultSpace * 5,
                    ),
                    child: Center(
                      child: Text(
                        "Login",
                        style: Theme.of(context).textTheme.displayLarge,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CRoundedContainer(
              height: height * .53,
              backgroundColor: CColors.primaryColor,
              radius: 0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CCustomTextFormFeild(
                        controller: emailPhoneCTRL,
                        icon: Icons.email_outlined,
                        hintText: 'Email or Phone Number',
                      ),
                      const SizedBox(height: CSizes.spaceBtwInputFeild),
                      CCustomTextFormFeild(
                        controller: passwordCTRL,
                        icon: Icons.lock_outline,
                        hintText: 'Password / OTP',
                        obscureText: isVisible,
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
                              builder: (context) => const MainScreen(),
                            ),
                            (route) => false,
                          );
                        },
                        child: CRoundedContainer(
                          width: double.infinity,
                          padding: const EdgeInsets.all(CSizes.defaultSpace),
                          backgroundColor: CColors.secondaryColor,
                          radius: 8,
                          child: Center(
                            child: Text(
                              " Login",
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
