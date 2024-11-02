import 'package:digixnet/core/commen/widgets/container/rounded_container.dart';
import 'package:digixnet/core/utils/sizes/sizes.dart';
import 'package:digixnet/features/enqiury/screens/enqiury_screen.dart';
import 'package:digixnet/features/home/screen/home_screen.dart';
import 'package:digixnet/features/profile/screens/profile_screen.dart';
import 'package:digixnet/features/service/screens/service_screen.dart';
import 'package:digixnet/features/splash/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';

import 'core/utils/color/colors.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);
  @override
  void initState() {
    super.initState();
  }

  final List<PersistentBottomNavBarItem> _navBarItems = [
    PersistentBottomNavBarItem(
      icon: const Icon(
        Iconsax.home,
      ),
      activeColorPrimary: CColors.darkerGreyColor,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: CColors.darkerGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Iconsax.grid_1),
      activeColorPrimary: CColors.darkerGreyColor,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: CColors.darkerGreyColor,
    ),
    PersistentBottomNavBarItem(
        icon: Tooltip(
          message: 'Create Service Request',
          padding: const EdgeInsets.all(30),
          margin: const EdgeInsets.only(top: 80, left: 50),
          decoration: BoxDecoration(
              color: CColors.secondaryColor,
              borderRadius: BorderRadius.circular(20)),
          textStyle: const TextStyle(
              fontSize: 15,
              fontStyle: FontStyle.italic,
              color: CColors.whiteColor),
          child: const Icon(
            Icons.add,
            color: CColors.whiteColor,
          ),
        ),
        activeColorPrimary: CColors.secondaryColor,
        inactiveColorPrimary: CColors.secondaryColor,
        activeColorSecondary: CColors.secondaryColor,
        inactiveColorSecondary: CColors.secondaryColor),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Iconsax.profile_circle,
      ),
      activeColorPrimary: CColors.darkerGreyColor,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: CColors.darkerGreyColor,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.logout),
      activeColorPrimary: CColors.darkerGreyColor,
      inactiveColorPrimary: Colors.grey,
      activeColorSecondary: CColors.darkerGreyColor,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: PersistentTabView(
        context,
        screens: [
          const HomeScreen(),
          const EnqiuryScreen(),
          const ServiceScreen(),
          const ProfileScreen(),
          Center(
            child: CRoundedContainer(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              backgroundColor: CColors.primaryColor,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Do You want to logout?',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: CSizes.lg),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SplashScreen(),
                        ),
                        (route) => false,
                      );
                    },
                    child: CRoundedContainer(
                      backgroundColor: CColors.secondaryColor,
                      padding: const EdgeInsets.all(010),
                      child: Text(
                        "LogOut",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: CColors.whiteColor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
        controller: _controller,
        items: _navBarItems,
        backgroundColor: CColors.primaryColor,
        navBarStyle: NavBarStyle.style15,
        decoration: NavBarDecoration(borderRadius: BorderRadius.circular(0)),
      ),
    );
  }
}
