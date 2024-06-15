import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/constants/sizes.dart';
import 'package:pawrfecto/utils/device/device_utility.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TSearchContainer extends StatelessWidget {
  const TSearchContainer({
    super.key,
    required this.text,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onTap,
  });

  final String text;
  final IconData? icon;
  final bool showBackground;
  final bool showBorder;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Container(
          width: TDeviceUtils.getScreenWidth(context),
          padding: const EdgeInsets.all(TSizes.md),
          decoration: BoxDecoration(
            color: showBackground ? dark ? TColors.darkContainer : TColors.lightContainer : Colors.transparent,
            borderRadius: BorderRadius.circular(TSizes.cardRadiusLG),
            border: showBorder ? Border.all(color: TColors.grey) : null,
          ),

          child: Row(
            children: [
              Icon(icon, color: TColors.darkerGrey),
              const SizedBox(width: TSizes.spaceBetweenItems),
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ),
    );
  }
}