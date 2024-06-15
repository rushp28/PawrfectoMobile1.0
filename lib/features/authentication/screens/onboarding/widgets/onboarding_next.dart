import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/features/authentication/controllers/onboarding/onboarding_controller.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/device/device_utility.dart';

class OnboardingNext extends StatelessWidget {
  const OnboardingNext({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight(),
        child: ElevatedButton(
          onPressed: () => OnboardingController.instance.nextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(TSizes.lg),
            backgroundColor: TColors.primary,
            side: const BorderSide(color: TColors.primary),
          ),
          child: const Icon(
              Iconsax.arrow_right_3,
              size: TSizes.lg,
          ),
        )
    );
  }
}