import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/features/personalization/screens/settings/settings.dart';
import 'package:pawrfecto/features/shop/screens/home/home.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          // Navigation bar properties
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: dark ? TColors.black : TColors.white,
          indicatorColor: dark ? TColors.white.withOpacity(0.1) : TColors.black.withOpacity(0.1),

          // Navigation bar buttons
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: 'Store',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.heart),
              label: 'Wishlist',
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: 'Profile',
            ),
          ],
        ),
      ),

      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

// Navigation bar controller
class NavigationController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreen(),
    Container(color: Colors.purple),
    Container(color: Colors.orange),
    const SettingsScreen(),
  ];
}

