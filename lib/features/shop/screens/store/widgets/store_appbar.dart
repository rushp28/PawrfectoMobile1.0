import 'package:flutter/material.dart';
import 'package:pawrfecto/common/widgets/appbar/appbar.dart';
import 'package:pawrfecto/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:pawrfecto/utils/constants/colors.dart';
import 'package:pawrfecto/utils/helpers/helper_functions.dart';

class TStoreAppBar extends StatelessWidget {
  const TStoreAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Find the best products for your pets',
            style: dark ? Theme.of(context).textTheme.labelMedium!.apply(color: TColors.grey) : Theme.of(context).textTheme.labelMedium!.apply(color: TColors.darkerGrey),
          ),
          Text(
            'Store',
            style: dark ? Theme.of(context).textTheme.headlineLarge!.apply(color: TColors.grey) : Theme.of(context).textTheme.headlineLarge!.apply(color: TColors.black),
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
}