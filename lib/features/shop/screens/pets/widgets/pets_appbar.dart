import 'package:flutter/material.dart';
import 'package:pawrfecto/common/widgets/appbar/appbar.dart';
import 'package:pawrfecto/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TPetsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TPetsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Personalize your feed with your buddies!',
            style: dark
                ? Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey)
                : Theme.of(context).textTheme.labelMedium!.apply(color: TColors.darkerGrey),
          ),
          Text(
            'Your Buddies',
            style: dark
                ? Theme.of(context).textTheme.headlineLarge!.apply(color: TColors.grey)
                : Theme.of(context).textTheme.headlineLarge!.apply(color: TColors.black),
          ),
        ],
      ),
      actions: [
        TCartCounterIcon(
          onPressed: () {},
          iconColor: TColors.white,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}